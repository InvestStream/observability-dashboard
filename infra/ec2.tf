## Public ALB, target group, and listeners
resource "aws_lb" "public_alb" {
  name               = local.full_instance_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.public_alb.id]
  subnets            = data.aws_subnets.public.ids
}

resource "aws_lb_target_group" "langfuse" {
  name        = local.full_instance_name
  port        = 3000
  protocol    = "HTTP"
  vpc_id      = data.aws_vpc.main.id
  target_type = "ip"
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.public_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.langfuse.arn
  }
}


## Security group
resource "aws_security_group" "public_alb" {
  name   = "langfuse-public-alb"
  vpc_id = data.aws_vpc.main.id
}

resource "aws_vpc_security_group_ingress_rule" "langfuse_alb_http_ipv4" {
  security_group_id = aws_security_group.public_alb.id
  description       = "Allow inbound HTTP traffic (IPv4)"
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "alb_https_ipv4" {
  security_group_id = aws_security_group.public_alb.id
  description       = "Allow inbound HTTPS traffic (IPv4)"
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "alb_http_ipv6" {
  security_group_id = aws_security_group.public_alb.id
  description       = "Allow inbound HTTP traffic (IPv6)"
  cidr_ipv6         = "::/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "alb_https_ipv6" {
  security_group_id = aws_security_group.public_alb.id
  description       = "Allow inbound HTTPS traffic (IPv6)"
  cidr_ipv6         = "::/0"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "alb_to_fargate" {
  security_group_id = aws_security_group.public_alb.id
  description       = "Allow outbound traffic to Fargate instance"
  from_port         = 3000
  to_port           = 3000
  ip_protocol       = "tcp"

  referenced_security_group_id = aws_security_group.fargate.id
}