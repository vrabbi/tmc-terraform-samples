resource "tanzu-mission-control_iam_policy" "demo_operator" {
  depends_on = [
    tanzu-mission-control_workspace.demo
  ]
  count = length(var.workspaces)
  scope {
    workspace {
      name = var.workspaces[count.index].name
    }
  }
  role_bindings {
    role = "namespace.admin"

    dynamic "subjects" {
      for_each = toset(var.workspaces[count.index]["admin_groups"])
      content {
        name = subjects.value
        kind = "GROUP"
      }
    }
  }
}

resource "tanzu-mission-control_iam_policy" "demo_editor" {
  depends_on = [
    tanzu-mission-control_iam_policy.demo_operator
  ]
  count = length(var.workspaces)
  scope {
    workspace {
      name = var.workspaces[count.index].name
    }
  }
  role_bindings {
    role = "namespace.edit"

    dynamic "subjects" {
      for_each = toset(var.workspaces[count.index]["edit_groups"])
      content {
        name = subjects.value
        kind = "GROUP"
      }
    }
  }
}

resource "tanzu-mission-control_iam_policy" "demo_viewer" {
  depends_on = [
    tanzu-mission-control_iam_policy.demo_editor
  ]
  count = length(var.workspaces)
  scope {
    workspace {
      name = var.workspaces[count.index].name
    }
  }
  role_bindings {
    role = "namespace.view"

    dynamic "subjects" {
      for_each = toset(var.workspaces[count.index]["view_groups"])
      content {
        name = subjects.value
        kind = "GROUP"
      }
    }
  }
}
