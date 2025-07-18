output "role" {
  description = "IAM roles for ECS"
  value = {
    execution  = aws_iam_role.execution
    task       = aws_iam_role.task
    instance   = var.enable_instance_iam ? aws_iam_role.instance[0] : null
    codedeploy = var.enable_codedeploy_iam ? aws_iam_role.codedeploy[0] : null
  }
}

output "instance_profile" {
  description = "Instance Profile for ECS"
  value       = var.enable_instance_iam ? aws_iam_instance_profile.this[0] : null
}
