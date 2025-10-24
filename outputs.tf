output "role" {
  description = "IAM roles for ECS"
  value = {
    execution  = aws_iam_role.execution
    task       = aws_iam_role.task
    codedeploy = var.enable_codedeploy_iam ? aws_iam_role.codedeploy[0] : null
  }
}
