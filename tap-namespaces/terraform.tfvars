workspaces = [
  {
    name         = "app-01"
    description  = "first app demo"
    view_groups  = ["ts-view"]
    edit_groups  = ["ts-edit"]
    admin_groups = ["ts-devops", "ts-admins"]
  },
  {
    name         = "app-02"
    description  = "app demo 2"
    view_groups  = ["monitoring-team-02"]
    edit_groups  = ["dev-team-02"]
    admin_groups = ["ts-devops", "ts-admins"]
  },
  {
    name         = "app-03"
    description  = "application demo 3"
    view_groups  = ["monitoring-team-03"]
    edit_groups  = ["dev-team-03"]
    admin_groups = ["ts-admins", "ts-devops"]
  },
  {
    name         = "app-04"
    description  = "app demo 4"
    view_groups  = ["monitoring-team-04"]
    edit_groups  = ["dev-team-04"]
    admin_groups = ["ts-devops", "ts-admins"]
  }
]
tap_clusters = [
  "tap1-cls",
  "tap-scott-1uxg3t5m1jwp",
  "tap-16-cls"
]
