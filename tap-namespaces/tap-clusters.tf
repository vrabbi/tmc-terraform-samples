data "tanzu-mission-control_cluster" "demo" {
  for_each = toset(var.tap_clusters)
  name     = each.value
}
