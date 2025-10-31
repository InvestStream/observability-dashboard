## Task definition
data "template_file" "container_definitions" {
  template = file("${path.module}/ecs_task.json.tpl")
}

resource "aws_ecs_task_definition" "langfuse" {
  family                   = "langfuse"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "4096"
  memory                   = "16384"
  execution_role_arn       = aws_iam_role.langfuse_execution_role.arn ## To pull images, write logs
  task_role_arn            = aws_iam_role.langfuse_execution_role.arn ## To call AWS services
  container_definitions    = jsonencode(data.template_file.container_definitions.rendered)

  ## Volumes for ephemeral data storage, referenced in task definition JSON
  volume {
    name = "langfuse_postgres_data"
    docker_volume_configuration {
      driver = "local"
      scope  = "task"
    }
  }

  volume {
    name = "langfuse_clickhouse_data"
    docker_volume_configuration {
      driver = "local"
      scope  = "task"
    }
  }

  volume {
    name = "langfuse_clickhouse_logs"
    docker_volume_configuration {
      driver = "local"
      scope  = "task"
    }
  }

  volume {
    name = "langfuse_minio_data"
    docker_volume_configuration {
      driver = "local"
      scope  = "task"
    }
  }

  ephemeral_storage {
    size_in_gib = 21 ## Value between 21-200GB
  }

  runtime_platform {
    cpu_architecture        = "X86_64"
    operating_system_family = "LINUX"
  }
}


## IAM role with AWS managed policy
resource "aws_iam_role" "langfuse_execution_role" {
  name = "ecsLangfuseTaskExecutionRole"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = { Service = "ecs-tasks.amazonaws.com" }
      Action    = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution_policy" {
  role       = aws_iam_role.langfuse_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}


## ECS cluster and service
resource "aws_ecs_cluster" "langfuse" {
  name = local.full_instance_name
}

resource "aws_ecs_service" "langfuse" {
  name            = local.full_instance_name
  cluster         = aws_ecs_cluster.langfuse.id
  task_definition = aws_ecs_task_definition.langfuse.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  deployment_maximum_percent         = 200
  deployment_minimum_healthy_percent = 100

  network_configuration {
    subnets          = data.aws_subnets.private.ids
    security_groups  = [aws_security_group.fargate.id]
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.langfuse.arn
    container_name   = "langfuse"
    container_port   = 3000
  }

  depends_on = [aws_lb_listener.http]
}


## Security group
resource "aws_security_group" "fargate" {
  name   = "langfuse-fargate"
  vpc_id = data.aws_vpc.main.id
}

resource "aws_vpc_security_group_egress_rule" "fargate_sg_egress" {
  security_group_id = aws_security_group.fargate.id
  description       = "Allow outbound traffic to CloudWatch Logs VPC endpoint"
  ip_protocol       = "tcp"

  referenced_security_group_id = sort(data.aws_vpc_endpoint.logs.security_group_ids)[0]
}

resource "aws_vpc_security_group_ingress_rule" "fargate_sg_ingress" {
  security_group_id = aws_security_group.fargate.id
  description       = "Allow inbound traffic from ALB security group"
  from_port         = 3000
  to_port           = 3000
  ip_protocol       = "tcp"

  referenced_security_group_id = aws_security_group.public_alb.id
}


## CloudWatch log group
resource "aws_cloudwatch_log_group" "langfuse" {
  kms_key_id        = null
  log_group_class   = "STANDARD"
  name              = "/aws/ecs/${local.full_instance_name}"
  region            = local.region
  retention_in_days = 30
  skip_destroy      = true ## On destroy time, keep the log group but remove from tf state
}

