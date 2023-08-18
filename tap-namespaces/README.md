<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tanzu-mission-control"></a> [tanzu-mission-control](#provider\_tanzu-mission-control) | 1.2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tanzu-mission-control_iam_policy.demo_editor](https://registry.terraform.io/providers/vmware/tanzu-mission-control/latest/docs/resources/iam_policy) | resource |
| [tanzu-mission-control_iam_policy.demo_operator](https://registry.terraform.io/providers/vmware/tanzu-mission-control/latest/docs/resources/iam_policy) | resource |
| [tanzu-mission-control_iam_policy.demo_viewer](https://registry.terraform.io/providers/vmware/tanzu-mission-control/latest/docs/resources/iam_policy) | resource |
| [tanzu-mission-control_namespace.demo](https://registry.terraform.io/providers/vmware/tanzu-mission-control/latest/docs/resources/namespace) | resource |
| [tanzu-mission-control_workspace.demo](https://registry.terraform.io/providers/vmware/tanzu-mission-control/latest/docs/resources/workspace) | resource |
| [tanzu-mission-control_cluster.demo](https://registry.terraform.io/providers/vmware/tanzu-mission-control/latest/docs/data-sources/cluster) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_tap_clusters"></a> [tap\_clusters](#input\_tap\_clusters) | n/a | `list(string)` | n/a | yes |
| <a name="input_workspaces"></a> [workspaces](#input\_workspaces) | n/a | <pre>list(object({<br>    name         = string<br>    description  = string<br>    view_users   = optional(list(string))<br>    edit_users   = optional(list(string))<br>    admin_users  = optional(list(string))<br>    view_groups  = optional(list(string))<br>    edit_groups  = optional(list(string))<br>    admin_groups = optional(list(string))<br>  }))</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->