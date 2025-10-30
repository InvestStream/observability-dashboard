locals {
  account_id = data.aws_caller_identity.current.account_id
  region     = data.aws_region.current.region

  service_name = "langfuse"

  full_instance_name = (
    var.instance_name == "" ? local.service_name :
    "${local.service_name}-${var.instance_name}"
  )
}