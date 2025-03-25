data "aws_partition" "current" {}
data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

locals {
  partition  = data.aws_partition.current.partition
  region     = data.aws_region.current.name
  account_id = data.aws_caller_identity.current.account_id
  dns_suffix = data.aws_partition.current.dns_suffix
}

data "aws_iam_policy_document" "root_trust" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["arn:${local.partition}:iam::${local.account_id}:root"]
    }
  }
}

locals {
  enable_instance_iam = true

  task_additional_trust_policy_documents = [data.aws_iam_policy_document.root_trust.json]
}

module "ecs_iam" {
  source = "../"

  task_role_name        = var.task_role_name
  execution_role_name   = var.execution_role_name
  instance_role_name    = var.instance_role_name
  instance_profile_name = var.instance_profile_name
  enable_instance_iam   = local.enable_instance_iam

  task_additional_trust_policy_documents = local.task_additional_trust_policy_documents
}
