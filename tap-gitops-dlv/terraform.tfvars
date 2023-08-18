tap_run_clusters = [
  {
    name = "tap1-cls"
    branch = "main"
  },
  {
    name = "tap-scott-1uxg3t5m1jwp"
    branch = "dev"
  },
  {
    name = "tap-16-cls"
    branch = "demo"
  }
]

git_repo = "https://github.com/vrabbi/tap-gitops"

tap_namespaces = [
  "default",
  "tap-workload",
  "demo"
]
