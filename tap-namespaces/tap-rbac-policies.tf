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
    role = "tap-app-operator-role"

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
    tanzu-mission-control_workspace.demo
  ]
  count = length(var.workspaces)
  scope {
    workspace {
      name = var.workspaces[count.index].name
    }
  }
  role_bindings {
    role = "tap-app-editor-role"

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
    tanzu-mission-control_workspace.demo
  ]
  count = length(var.workspaces)
  scope {
    workspace {
      name = var.workspaces[count.index].name
    }
  }
  role_bindings {
    role = "tap-app-viewer-role"

    dynamic "subjects" {
      for_each = toset(var.workspaces[count.index]["view_groups"])
      content {
        name = subjects.value
        kind = "GROUP"
      }
    }
  }
}
