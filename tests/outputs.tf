output "role_arns" {
  value = [
    module.ecs_iam.role.execution.arn,
    module.ecs_iam.role.task.arn,
    module.ecs_iam.role.instance.arn,
  ]
}

output "instance_profile_name" {
  value = module.ecs_iam.instance_profile.name
}
