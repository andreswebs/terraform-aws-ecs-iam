module "ecs_iam" {
  source                = "github.com/andreswebs/terraform-aws-ecs-iam"
  task_role_name        = var.task_role_name
  execution_role_name   = var.execution_role_name
  instance_role_name    = var.instance_role_name
  instance_profile_name = var.instance_profile_name
}
