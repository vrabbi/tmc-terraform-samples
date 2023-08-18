<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tanzu-mission-control"></a> [tanzu-mission-control](#provider\_tanzu-mission-control) | 1.2.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tanzu-mission-control_iam_policy.demo_editor](https://registry.terraform.io/providers/vmware/tanzu-mission-control/latest/docs/resources/iam_policy) | resource |
| [tanzu-mission-control_iam_policy.demo_operator](https://registry.terraform.io/providers/vmware/tanzu-mission-control/latest/docs/resources/iam_policy) | resource |
| [tanzu-mission-control_iam_policy.demo_viewer](https://registry.terraform.io/providers/vmware/tanzu-mission-control/latest/docs/resources/iam_policy) | resource |
| [tanzu-mission-control_image_policy.workspace_scoped_custom_image_policy](https://registry.terraform.io/providers/vmware/tanzu-mission-control/latest/docs/resources/image_policy) | resource |
| [tanzu-mission-control_namespace.demo](https://registry.terraform.io/providers/vmware/tanzu-mission-control/latest/docs/resources/namespace) | resource |
| [tanzu-mission-control_network_policy.coredns_egress](https://registry.terraform.io/providers/vmware/tanzu-mission-control/latest/docs/resources/network_policy) | resource |
| [tanzu-mission-control_network_policy.ingress_controller_only](https://registry.terraform.io/providers/vmware/tanzu-mission-control/latest/docs/resources/network_policy) | resource |
| [tanzu-mission-control_workspace.demo](https://registry.terraform.io/providers/vmware/tanzu-mission-control/latest/docs/resources/workspace) | resource |
| [tanzu-mission-control_cluster.demo](https://registry.terraform.io/providers/vmware/tanzu-mission-control/latest/docs/data-sources/cluster) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_registry_hostname"></a> [allowed\_registry\_hostname](#input\_allowed\_registry\_hostname) | n/a | `string` | n/a | yes |
| <a name="input_clusters"></a> [clusters](#input\_clusters) | n/a | `list(string)` | n/a | yes |
| <a name="input_coredns_namespace"></a> [coredns\_namespace](#input\_coredns\_namespace) | n/a | `string` | `"kube-system"` | no |
| <a name="input_coredns_pod_selector"></a> [coredns\_pod\_selector](#input\_coredns\_pod\_selector) | n/a | `map(string)` | <pre>{<br>  "k8s-app": "kube-dns"<br>}</pre> | no |
| <a name="input_ingress_controller_namespace"></a> [ingress\_controller\_namespace](#input\_ingress\_controller\_namespace) | n/a | `string` | `"tanzu-system-ingress"` | no |
| <a name="input_workspaces"></a> [workspaces](#input\_workspaces) | n/a | <pre>list(object({<br>    name         = string<br>    description  = string<br>    view_groups  = optional(list(string))<br>    edit_groups  = optional(list(string))<br>    admin_groups = optional(list(string))<br>    labels       = optional(map(string), { "tf-managed" = "yes" })<br>  }))</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->