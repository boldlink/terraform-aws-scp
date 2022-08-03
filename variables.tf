variable "target_ids" {
  type        = list(string)
  description = "The unique identifier (IDS) of the root, organizational units, or account numbers that you want to attach the policy to."
}

variable "name" {
  type        = string
  description = "The friendly name to assign to the policy."
}

variable "tags" {
  type        = map(string)
  description = "(Optional) Key-value map of resource tags."
  default     = {}
}

variable "content" {
  type        = string
  description = "The policy content to add to the new policy. For example, if you create a service control policy (SCP), this string must be JSON text that specifies the permissions that admins in attached accounts can delegate to their users, groups, and roles."
}
