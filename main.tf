
/**
* Trust policy used by both the ECS 'Task Execution Role' and 'Task Role'
*/
data "aws_iam_policy_document" "tasks_trust" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
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
  assume_role_policy = data.aws_iam_policy_document.tasks_trust.json
}

resource "aws_iam_role_policy_attachment" "execution_role" {
  role       = aws_iam_role.execution.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

/**
* ECS 'Task Role'
*/
resource "aws_iam_role" "task" {
  name               = var.task_role_name
  assume_role_policy = data.aws_iam_policy_document.tasks_trust.json
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
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "instance" {
  name               = var.instance_role_name
  assume_role_policy = data.aws_iam_policy_document.ec2_trust.json
}

resource "aws_iam_instance_profile" "this" {
  name = var.instance_profile_name
  role = aws_iam_role.instance.name
}

locals {

  instance_managed_policies = [
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
    "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy",
    "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
  ]

}

resource "aws_iam_role_policy_attachment" "instance" {
  for_each   = toset(local.instance_managed_policies)
  role       = aws_iam_role.instance.name
  policy_arn = each.value
}
