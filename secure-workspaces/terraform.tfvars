workspaces = [
  {
    name         = "sec-ns-01"
    description  = "first app demo"
    view_groups  = ["ts-view"]
    edit_groups  = ["ts-edit"]
    admin_groups = ["ts-devops", "ts-admins"]
    labels = {
      "test" = "value"
    }
  },
  {
    name         = "sec-ns-02"
    description  = "app demo 2"
    view_groups  = ["monitoring-team-02"]
    edit_groups  = ["dev-team-02"]
    admin_groups = ["ts-devops", "ts-admins"]
    labels = {
      "sample-label" = "awesome-value"
    }
  }
]
clusters = [
  "tap-scott-1uxg3t5m1jwp",
  "tap-16-cls"
]
allowed_registry_hostname = "harbor.vrabbi.cloud"
