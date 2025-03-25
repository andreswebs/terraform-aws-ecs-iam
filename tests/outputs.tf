output "role_arns" {
  value = compact([
    module.ecs_iam.role.execution.arn,
    module.ecs_iam.role.task.arn,
    local.enable_instance_iam ? module.ecs_iam.role.instance.arn : "",
  ])
}

output "instance_profile_name" {
  value = local.enable_instance_iam ? module.ecs_iam.instance_profile.name : ""
}
