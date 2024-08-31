variable "task_role_name" {
  type        = string
  description = "ECS 'Task Role' name"
  default     = null
}

variable "execution_role_name" {
  type        = string
  description = "ECS 'Task Execution Role' name"
  default     = null
}

variable "instance_role_name" {
  type        = string
  description = "ECS container instance role name"
  default     = null
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
