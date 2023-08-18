resource "tanzu-mission-control_git_repository" "create_cluster_git_repository" {
  for_each = { for entry in var.tap_run_clusters : "${entry.branch}" => entry }
  name = "tap-gitops-repo-${each.value.name}-${each.value.branch}" 

  namespace_name = "tanzu-continuousdelivery-resources"

  scope {
    cluster {
      name            = data.tanzu-mission-control_cluster.demo["${each.value.name}"].name
      provisioner_name        = data.tanzu-mission-control_cluster.demo["${each.value.name}"].provisioner_name
      management_cluster_name = data.tanzu-mission-control_cluster.demo["${each.value.name}"].management_cluster_name
    }
  }

  meta {
    description = "Created through terraform"
  }

  spec {
    url = var.git_repo 
    interval = "10m"
    ref {
      branch = each.value.branch 
    } 
  }
}


locals {
  namespaces = distinct(flatten([
    for cluster in var.tap_run_clusters : [
      for namespace in var.tap_namespaces : {
        name               = namespace
        cluster            = cluster.name
        branch = cluster.branch
      }
    ]
  ]))
}


resource "tanzu-mission-control_kustomization" "create_cluster_kustomization" {
  depends_on = [tanzu-mission-control_git_repository.create_cluster_git_repository]
  for_each = { for entry in local.namespaces : "${entry.branch}.${entry.cluster}.${entry.name}" => entry }
  
  name = "tap-workloads-${each.value.cluster}-${each.value.name}-${each.value.branch}"

  namespace_name = "tanzu-continuousdelivery-resources"

  scope {
    cluster {
      name            = each.value.cluster
      provisioner_name        = data.tanzu-mission-control_cluster.demo["${each.value.cluster}"].provisioner_name
      management_cluster_name = data.tanzu-mission-control_cluster.demo["${each.value.cluster}"].management_cluster_name
    }
  }

  meta {
    description = "Created through terraform"
  }

  spec {
    path = "config/${each.value.name}"
    interval = "10m"
    target_namespace = each.value.name
    source {
        name = "tap-gitops-repo-${each.value.cluster}-${each.value.branch}"
        namespace = "tanzu-continuousdelivery-resources"
    }
  }
}
