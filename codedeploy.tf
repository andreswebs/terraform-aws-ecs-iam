data "aws_iam_policy_document" "codedeploy_trust" {
  count = var.enable_codedeploy_iam ? 1 : 0

  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["codedeploy.${local.dns_suffix}"]
    }
  }
}

resource "aws_iam_role" "codedeploy" {
  count = var.enable_codedeploy_iam ? 1 : 0

  name                  = var.codedeploy_role_name
  assume_role_policy    = data.aws_iam_policy_document.codedeploy_trust[0].json
  force_detach_policies = true
  description           = var.codedeploy_role_description
  tags                  = merge(var.tags, var.codedeploy_role_tags)
}

resource "aws_iam_role_policy_attachment" "AWSCodeDeployRole" {
  count = var.enable_codedeploy_iam ? 1 : 0

  policy_arn = "${local.managed_policy_arn_prefix}/service-role/AWSCodeDeployRole"
  role       = aws_iam_role.codedeploy[0].name
}

resource "aws_iam_role_policy_attachment" "AWSCodeDeployRoleForECS" {
  count = var.enable_codedeploy_iam ? 1 : 0

  policy_arn = "${local.managed_policy_arn_prefix}/AWSCodeDeployRoleForECS"
  role       = aws_iam_role.codedeploy[0].name
}
