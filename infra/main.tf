terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  backend "s3" {
    bucket = "investstream-tfstate-sandbox-20250523073931712000000001"
    key    = "tfstate/langfuse/langfuse"
    region = "ap-southeast-2"

    use_lockfile = true
  }
}

provider "aws" {
  region = "ap-southeast-2"
}
