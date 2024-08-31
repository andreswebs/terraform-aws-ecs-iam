output "role" {
  description = "IAM roles for ECS"
  value = {
    execution = aws_iam_role.execution
    task      = aws_iam_role.task
    instance  = aws_iam_role.instance
  }
}

output "instance_profile" {
  description = "Instance Profile for ECS"
  value       = aws_iam_instance_profile.this
}
