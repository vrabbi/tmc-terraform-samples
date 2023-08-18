variable "workspaces" {
  type = list(object({
    name         = string
    description  = string
    view_users   = optional(list(string))
    edit_users   = optional(list(string))
    admin_users  = optional(list(string))
    view_groups  = optional(list(string))
    edit_groups  = optional(list(string))
    admin_groups = optional(list(string))
  }))
}

variable "tap_clusters" {
  type = list(string)
}
