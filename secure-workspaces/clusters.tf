data "tanzu-mission-control_cluster" "demo" {
  for_each = toset(var.clusters)
  name     = each.value
}
