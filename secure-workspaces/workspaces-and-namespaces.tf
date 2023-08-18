locals {
  namespaces = distinct(flatten([
    for cluster in data.tanzu-mission-control_cluster.demo : [
      for workspace in var.workspaces : {
        description        = workspace["description"]
        name               = workspace["name"]
        cluster            = cluster.name
        provisioner        = cluster.provisioner_name
        management_cluster = cluster.management_cluster_name
        labels             = workspace["labels"]

      }
    ]
  ]))
}

resource "tanzu-mission-control_workspace" "demo" {
  for_each = { for entry in var.workspaces : "${entry.description}.${entry.name}" => entry }
  name     = each.value.name

  meta {
    description = each.value.description
    labels      = each.value.labels
  }
}

resource "tanzu-mission-control_namespace" "demo" {
  depends_on = [
    tanzu-mission-control_workspace.demo
  ]
  for_each                = { for entry in local.namespaces : "${entry.description}.${entry.name}.${entry.cluster}.${entry.provisioner}.${entry.management_cluster}" => entry }
  name                    = each.value.name
  cluster_name            = each.value.cluster
  provisioner_name        = each.value.provisioner
  management_cluster_name = each.value.management_cluster

  meta {
    description = each.value.description
    labels      = each.value.labels
  }

  spec {
    workspace_name = each.value.name
  }
}
