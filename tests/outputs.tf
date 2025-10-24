output "role_arns" {
  value = [
    module.ecs_iam.role.execution.arn,
    module.ecs_iam.role.task.arn,
  ]
}
