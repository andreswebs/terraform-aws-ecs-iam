data "aws_partition" "current" {}

locals {
  partition  = data.aws_partition.current.partition
  dns_suffix = data.aws_partition.current.dns_suffix

  managed_policy_arn_prefix = "arn:${local.partition}:iam::aws:policy"
}

/**
* Base trust policy used by both the ECS 'Task Execution Role' and 'Task Role'
*/
data "aws_iam_policy_document" "ecs_tasks_trust" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.${local.dns_suffix}"]
    }
  }
}

data "aws_iam_policy_document" "ssm_messages" {
  statement {
    sid = "ssmmessages"
    actions = [
      "ssmmessages:CreateControlChannel",
      "ssmmessages:CreateDataChannel",
      "ssmmessages:OpenControlChannel",
      "ssmmessages:OpenDataChannel"
    ]
    resources = ["*"]
  }
}

/**
* ECS 'Task Execution Role' and permissions
*/
resource "aws_iam_role" "execution" {
  name               = var.execution_role_name
  assume_role_policy = data.aws_iam_policy_document.ecs_tasks_trust.json
}

resource "aws_iam_role_policy_attachment" "execution_role" {
  role       = aws_iam_role.execution.name
  policy_arn = "${local.managed_policy_arn_prefix}/service-role/AmazonECSTaskExecutionRolePolicy"
}

/**
* ECS 'Task Role'
*/
data "aws_iam_policy_document" "task_trust" {
  source_policy_documents = compact(concat(
    [data.aws_iam_policy_document.ecs_tasks_trust.json],
    var.task_additional_trust_policy_documents
  ))
}

resource "aws_iam_role" "task" {
  name               = var.task_role_name
  assume_role_policy = data.aws_iam_policy_document.task_trust.json
}

data "aws_iam_policy_document" "task_permissions" {
  source_policy_documents = [
    data.aws_iam_policy_document.ssm_messages.json,
  ]
}

resource "aws_iam_role_policy" "task_permissions" {
  name   = "task-permissions"
  role   = aws_iam_role.task.name
  policy = data.aws_iam_policy_document.task_permissions.json
}


resource "aws_iam_role_policy_attachment" "task" {
  for_each   = toset(var.task_managed_policies)
  role       = aws_iam_role.task.name
  policy_arn = each.value
}

/**
* ECS container instance role and permissions
*/
data "aws_iam_policy_document" "ec2_trust" {
  count = var.enable_instance_iam ? 1 : 0

  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.${local.dns_suffix}"]
    }
  }
}

resource "aws_iam_role" "instance" {
  count              = var.enable_instance_iam ? 1 : 0
  name               = var.instance_role_name
  assume_role_policy = data.aws_iam_policy_document.ec2_trust[0].json
}

resource "aws_iam_instance_profile" "this" {
  count = var.enable_instance_iam ? 1 : 0
  name  = var.instance_profile_name
  role  = aws_iam_role.instance[0].name
}

locals {

  instance_managed_policies = [
    "${local.managed_policy_arn_prefix}/AmazonSSMManagedInstanceCore",
    "${local.managed_policy_arn_prefix}/CloudWatchAgentServerPolicy",
    "${local.managed_policy_arn_prefix}/service-role/AmazonEC2ContainerServiceforEC2Role"
  ]

}

resource "aws_iam_role_policy_attachment" "instance" {
  for_each   = var.enable_instance_iam ? toset(local.instance_managed_policies) : []
  role       = aws_iam_role.instance[0].name
  policy_arn = each.value
}
