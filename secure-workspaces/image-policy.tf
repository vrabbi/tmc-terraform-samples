resource "tanzu-mission-control_image_policy" "workspace_scoped_custom_image_policy" {
  name = "secure-image-policy"
  
  depends_on = [
    tanzu-mission-control_network_policy.coredns_egress
  ]
  
  count = length(var.workspaces)
  
  scope {
    workspace {
      workspace = var.workspaces[count.index].name
    }
  }

  spec {
    input {
      custom {
        audit = false
        rules {
          hostname = var.allowed_registry_hostname
          imagename = "*"
          port = "*"
          requiredigest = true
        }
      }
    }
  }
}
