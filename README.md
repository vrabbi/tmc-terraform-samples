# TMC Terraform Examples
This repo contains examples of use cases for TMC Terraform configurations.  
To use any of these modules, you will need to set the needed ENV vars for the TMC Endpoint and API TOKEN or update the provider configs.  
Sample terraform.tfvars files are provided but need to be updated based on your environments details.  

# Current Examples:
## 1. TAP Namespaces
This module creates a set of workspaces and the corresponding namespaces accross the relevant TAP clusters you define and applies RBAC policies as well as the needed TAP Namespace Provisioner label to prepare the namespaces for TAP workloads
## 2. TAP GitOps Delivery Configuration
This module create the FluxCD configurations to enable automated GitOps between TAP clusters when following a branch based promotion strategy. This module currently works with public git repositories but can easily be configured to work with a private repo as well.
## 3. Secure Workspace Creation
This module create workspaces and coresponding namespaces as well as very restrictive image policies, RBAC policies and network policies.

# Example for running the samples
```bash
# For any of the samples
export VMW_CLOUD_API_TOKEN="fill me in"
export TMC_ENDPOINT="<tenant name>.tmc.cloud.vmware.com"

# For TAP Namespaces Module
cd tap-namespaces
terraform apply

# For TAP GitOps Module
cd tap-gitops-dlv
terraform apply

# For Secure Workspace Module
cd secure-workspaces
terraform apply
```
