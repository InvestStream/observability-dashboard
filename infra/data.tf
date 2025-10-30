data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

data "aws_vpc" "main" {
  tags = {
    "Name" : "main"
  }
}

## Private subnet - No direct inbound traffic from internet (for app servers, Lambda functions, etc)
data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.main.id]
  }

  tags = {
    "NetworkTier" : "private"
  }
}

## Restricted subnet - No direct in-/outbound traffic from internet (for databases, internal-only resources, etc)
data "aws_subnets" "restricted" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.main.id]
  }

  tags = {
    "NetworkTier" : "restricted"
  }
}

## Public network tier for Internet-facing resources: Inbound and outbound Internet connectivity
data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.main.id]
  }

  tags = {
    "NetworkTier" : "public"
  }
}

## Cloudwatch Logs VPC endpoint
data "aws_vpc_endpoint" "logs" {
  vpc_id       = data.aws_vpc.main.id
  service_name = "com.amazonaws.${local.region}.logs"
}
