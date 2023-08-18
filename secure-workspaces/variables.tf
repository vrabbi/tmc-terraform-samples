
variable "workspaces" {
  type = list(object({
    name         = string
    description  = string
    view_groups  = optional(list(string))
    edit_groups  = optional(list(string))
    admin_groups = optional(list(string))
    labels       = optional(map(string), { "tf-managed" = "yes" })
  }))
}

variable "clusters" {
  type = list(string)
}

variable "allowed_registry_hostname" {
  type = string
}

variable "ingress_controller_namespace" {
  type = string
  default = "tanzu-system-ingress"
}

variable "coredns_namespace" {
  type = string
  default = "kube-system"
}

variable "coredns_pod_selector" {
  type = map(string)
  default = {
    "k8s-app" = "kube-dns"
  }
}
