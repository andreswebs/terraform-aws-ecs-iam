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
  source              = "github.com/andreswebs/terraform-aws-ecs-iam"
  task_role_name      = var.task_role_name
  execution_role_name = var.execution_role_name
}
```



## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_codedeploy_role_description"></a> [codedeploy\_role\_description](#input\_codedeploy\_role\_description) | CodeDeploy service role description | `string` | `null` | no |
| <a name="input_codedeploy_role_name"></a> [codedeploy\_role\_name](#input\_codedeploy\_role\_name) | CodeDeploy service role name | `string` | `null` | no |
| <a name="input_codedeploy_role_tags"></a> [codedeploy\_role\_tags](#input\_codedeploy\_role\_tags) | Tags applied to the CodeDeploy service role | `map(string)` | `{}` | no |
| <a name="input_enable_codedeploy_iam"></a> [enable\_codedeploy\_iam](#input\_enable\_codedeploy\_iam) | (Optional) Enable CodeDeploy IAM? | `bool` | `true` | no |
| <a name="input_execution_role_description"></a> [execution\_role\_description](#input\_execution\_role\_description) | ECS 'Task Execution Role' description | `string` | `null` | no |
| <a name="input_execution_role_name"></a> [execution\_role\_name](#input\_execution\_role\_name) | ECS 'Task Execution Role' name | `string` | `null` | no |
| <a name="input_execution_role_tags"></a> [execution\_role\_tags](#input\_execution\_role\_tags) | Tags applied to the ECS 'Task Execution Role' | `map(string)` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags applied to all the created resources | `map(string)` | `{}` | no |
| <a name="input_task_additional_policy_documents"></a> [task\_additional\_policy\_documents](#input\_task\_additional\_policy\_documents) | List of additional policy documents to be merged with the task role permissions | `list(string)` | `[]` | no |
| <a name="input_task_additional_trust_policy_documents"></a> [task\_additional\_trust\_policy\_documents](#input\_task\_additional\_trust\_policy\_documents) | List of additional trust policy documents to be merged with the base ecs-tasks trust policy | `list(string)` | `[]` | no |
| <a name="input_task_managed_policies"></a> [task\_managed\_policies](#input\_task\_managed\_policies) | Managed Policies to attach to the task role | `list(string)` | `[]` | no |
| <a name="input_task_role_description"></a> [task\_role\_description](#input\_task\_role\_description) | ECS 'Task Role' description | `string` | `null` | no |
| <a name="input_task_role_name"></a> [task\_role\_name](#input\_task\_role\_name) | ECS 'Task Role' name | `string` | `null` | no |
| <a name="input_task_role_tags"></a> [task\_role\_tags](#input\_task\_role\_tags) | Tags applied to the ECS 'Task Role' | `map(string)` | `{}` | no |

## Modules

No modules.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_role"></a> [role](#output\_role) | IAM roles for ECS |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 6.0 |

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.11 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 6.0 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.codedeploy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.execution](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.task](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.task_permissions](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy_attachment.codedeploy_ecs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.codedeploy_service](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.execution_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.task](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.codedeploy_trust](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.ecs_tasks_trust](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.ssm_messages](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.task_permissions](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.task_trust](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |

[//]: # (END_TF_DOCS)

## Authors

**Andre Silva** - [@andreswebs](https://github.com/andreswebs)

## License

This project is licensed under the [Unlicense](UNLICENSE).
