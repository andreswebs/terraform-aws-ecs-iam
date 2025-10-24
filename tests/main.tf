data "aws_partition" "current" {}
data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

locals {
  partition  = data.aws_partition.current.partition
  account_id = data.aws_caller_identity.current.account_id
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
  task_additional_trust_policy_documents = [data.aws_iam_policy_document.root_trust.json]
}

module "ecs_iam" {
  source = "../"

  task_role_name      = var.task_role_name
  execution_role_name = var.execution_role_name

  task_additional_trust_policy_documents = local.task_additional_trust_policy_documents
}
