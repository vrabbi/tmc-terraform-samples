data "tanzu-mission-control_cluster" "demo" {
  for_each = { for entry in var.tap_run_clusters : "${entry.name}" => entry }
  name     = each.value.name
}
