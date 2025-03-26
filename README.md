# terraform-aws-ecs-iam

- Task IAM Role
- Task Execution IAM Role
- Instance IAM Role
- Instance Profile

[//]: # (BEGIN_TF_DOCS)


## Usage

Example:

```hcl
module "ecs_iam" {
  source                = "github.com/andreswebs/terraform-aws-ecs-iam"
  task_role_name        = var.task_role_name
  execution_role_name   = var.execution_role_name
  instance_role_name    = var.instance_role_name
  instance_profile_name = var.instance_profile_name
}
```



## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_instance_iam"></a> [enable\_instance\_iam](#input\_enable\_instance\_iam) | (Optional) Enable instance IAM? | `bool` | `false` | no |
| <a name="input_execution_role_description"></a> [execution\_role\_description](#input\_execution\_role\_description) | ECS 'Task Execution Role' description | `string` | `null` | no |
| <a name="input_execution_role_name"></a> [execution\_role\_name](#input\_execution\_role\_name) | ECS 'Task Execution Role' name | `string` | `null` | no |
| <a name="input_instance_profile_name"></a> [instance\_profile\_name](#input\_instance\_profile\_name) | ECS container instance profile name | `string` | `null` | no |
| <a name="input_instance_role_description"></a> [instance\_role\_description](#input\_instance\_role\_description) | ECS container instance role description | `string` | `null` | no |
| <a name="input_instance_role_name"></a> [instance\_role\_name](#input\_instance\_role\_name) | ECS container instance role name | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags applied to all the created resources | `map(string)` | `{}` | no |
| <a name="input_task_additional_policy_documents"></a> [task\_additional\_policy\_documents](#input\_task\_additional\_policy\_documents) | List of additional policy documents to be merged with the task role permissions | `list(string)` | `[]` | no |
| <a name="input_task_additional_trust_policy_documents"></a> [task\_additional\_trust\_policy\_documents](#input\_task\_additional\_trust\_policy\_documents) | List of additional trust policy documents to be merged with the base ecs-tasks trust policy | `list(string)` | `[]` | no |
| <a name="input_task_managed_policies"></a> [task\_managed\_policies](#input\_task\_managed\_policies) | Managed Policies to attach to the task role | `list(string)` | `[]` | no |
| <a name="input_task_role_description"></a> [task\_role\_description](#input\_task\_role\_description) | ECS 'Task Role' description | `string` | `null` | no |
| <a name="input_task_role_name"></a> [task\_role\_name](#input\_task\_role\_name) | ECS 'Task Role' name | `string` | `null` | no |

## Modules

No modules.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_profile"></a> [instance\_profile](#output\_instance\_profile) | Instance Profile for ECS |
| <a name="output_role"></a> [role](#output\_role) | IAM roles for ECS |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_instance_profile.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.execution](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.task](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.task_permissions](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy_attachment.execution_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.task](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.ec2_trust](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.ecs_tasks_trust](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.ssm_messages](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.task_permissions](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.task_trust](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |

[//]: # (END_TF_DOCS)

## Authors

**Andre Silva** - [@andreswebs](https://github.com/andreswebs)

## License

This project is licensed under the [Unlicense](UNLICENSE.md).
