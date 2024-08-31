output "role" {
  value = {
    execution = aws_iam_role.execution
    task      = aws_iam_role.task
    instance  = aws_iam_role.instance
  }
}

output "instance_profile" {
  value = aws_iam_instance_profile.this
}
