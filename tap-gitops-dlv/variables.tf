variable "tap_run_clusters" {
  type = list(object({
    name = string
    branch = string
  }))
}

variable "git_repo" {
  type = string
}

variable "tap_namespaces" {
  type = list(string)
}
