variable "task_role_name" {
  type        = string
  description = "ECS 'Task Role' name"
  default     = null
}

variable "task_role_description" {
  type        = string
  description = "ECS 'Task Role' description"
  default     = null
}

variable "task_role_tags" {
  type        = map(string)
  description = "Tags applied to the ECS 'Task Role'"
  default     = {}
}

variable "execution_role_name" {
  type        = string
  description = "ECS 'Task Execution Role' name"
  default     = null
}

variable "execution_role_description" {
  type        = string
  description = "ECS 'Task Execution Role' description"
  default     = null
}

variable "execution_role_tags" {
  type        = map(string)
  description = "Tags applied to the ECS 'Task Execution Role'"
  default     = {}
}

variable "instance_role_name" {
  type        = string
  description = "ECS container instance role name"
  default     = null
}

variable "instance_role_description" {
  type        = string
  description = "ECS container instance role description"
  default     = null
}

variable "instance_role_tags" {
  type        = map(string)
  description = "Tags applied to the ECS container instance role"
  default     = {}
}

variable "instance_profile_name" {
  type        = string
  description = "ECS container instance profile name"
  default     = null
}

variable "task_managed_policies" {
  type        = list(string)
  description = "Managed Policies to attach to the task role"
  default     = []
}

variable "enable_instance_iam" {
  type        = bool
  description = "(Optional) Enable instance IAM?"
  default     = false
}

variable "task_additional_trust_policy_documents" {
  type        = list(string)
  description = "List of additional trust policy documents to be merged with the base ecs-tasks trust policy"
  default     = []
}

variable "task_additional_policy_documents" {
  type        = list(string)
  description = "List of additional policy documents to be merged with the task role permissions"
  default     = []
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to all the created resources"
  default     = {}
}
