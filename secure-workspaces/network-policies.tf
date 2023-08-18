resource "tanzu-mission-control_network_policy" "ingress_controller_only" {
  name = "allow-ingress-only-from-ingress-controller"

  depends_on = [
    tanzu-mission-control_iam_policy.demo_viewer
  ]

  count = length(var.workspaces)

  scope {
    workspace {
      workspace = var.workspaces[count.index].name
    }
  }  

  spec {
    input {
      custom_ingress {
        to_pod_labels = {
          "ingress-needed" = "true"
        }
        rules {
          ports {}
          rule_spec {
            custom_selector {
              namespace_selector = {
                "kubernetes.io/metadata.name" = var.ingress_controller_namespace
              }
            }
          }
        }
      }
    }

  }
}

resource "tanzu-mission-control_network_policy" "coredns_egress" {
  name = "allow-egress-only-to-coredns"

  depends_on = [
    tanzu-mission-control_network_policy.ingress_controller_only
  ]

  count = length(var.workspaces)

  scope {
    workspace {
      workspace = var.workspaces[count.index].name
    }
  }

  spec {
    input {
      custom_egress {
        to_pod_labels = {"dns-needed" = "true"}
        rules {
          ports {
            port = "53"
            protocol = "TCP"
          }
          ports {
            port = "53"
            protocol = "UDP"
          }
          rule_spec {
            custom_selector {
              namespace_selector = {
                "kubernetes.io/metadata.name" = var.coredns_namespace
              }
              pod_selector = var.coredns_pod_selector
            }
          }
        }
      }
    }
  }
}
