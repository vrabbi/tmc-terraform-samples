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
| [tanzu-mission-control_git_repository.create_cluster_git_repository](https://registry.terraform.io/providers/vmware/tanzu-mission-control/latest/docs/resources/git_repository) | resource |
| [tanzu-mission-control_kustomization.create_cluster_kustomization](https://registry.terraform.io/providers/vmware/tanzu-mission-control/latest/docs/resources/kustomization) | resource |
| [tanzu-mission-control_cluster.demo](https://registry.terraform.io/providers/vmware/tanzu-mission-control/latest/docs/data-sources/cluster) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_git_repo"></a> [git\_repo](#input\_git\_repo) | n/a | `string` | n/a | yes |
| <a name="input_tap_namespaces"></a> [tap\_namespaces](#input\_tap\_namespaces) | n/a | `list(string)` | n/a | yes |
| <a name="input_tap_run_clusters"></a> [tap\_run\_clusters](#input\_tap\_run\_clusters) | n/a | <pre>list(object({<br>    name = string<br>    branch = string<br>  }))</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->