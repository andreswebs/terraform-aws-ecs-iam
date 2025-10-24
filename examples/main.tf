module "ecs_iam" {
  source              = "github.com/andreswebs/terraform-aws-ecs-iam"
  task_role_name      = var.task_role_name
  execution_role_name = var.execution_role_name
}
