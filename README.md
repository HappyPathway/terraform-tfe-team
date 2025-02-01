# terraform-tfe-token
Terraform module for creating a team and team token for TFE

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | ~> 3.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tfe"></a> [tfe](#provider\_tfe) | n/a |
| <a name="provider_vault"></a> [vault](#provider\_vault) | ~> 3.4 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_workspace_permissions"></a> [workspace\_permissions](#module\_workspace\_permissions) | ./project_workspace_permissions | n/a |

## Resources

| Name | Type |
|------|------|
| [tfe_team.team](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/team) | resource |
| [tfe_team_access.workspaces](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/team_access) | resource |
| [tfe_team_members.team_members](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/team_members) | resource |
| [tfe_team_project_access.team_project_access](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/team_project_access) | resource |
| [tfe_team_token.team_token](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/team_token) | resource |
| [vault_generic_secret.team_token_secret](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/generic_secret) | resource |
| [tfe_project.projects](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/data-sources/project) | data source |
| [tfe_team.team](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/data-sources/team) | data source |
| [tfe_workspace.workspaces](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/data-sources/workspace) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_team"></a> [create\_team](#input\_create\_team) | Whether to create a team | `bool` | `false` | no |
| <a name="input_organization"></a> [organization](#input\_organization) | The name of the organization | `string` | n/a | yes |
| <a name="input_team_members"></a> [team\_members](#input\_team\_members) | A list of usernames to add to the team | `list(string)` | `[]` | no |
| <a name="input_team_name"></a> [team\_name](#input\_team\_name) | The name of the team | `string` | n/a | yes |
| <a name="input_tfe_projects"></a> [tfe\_projects](#input\_tfe\_projects) | A list of projects to create | <pre>list(object({<br>    name                  = string<br>    access_level          = string<br>    workspace_permissions = optional(string, "read")<br>    inherit_permissions   = optional(bool, true)<br>  }))</pre> | `[]` | no |
| <a name="input_tfe_workspaces"></a> [tfe\_workspaces](#input\_tfe\_workspaces) | A list of workspaces to create | <pre>list(object({<br>    name         = string<br>    access_level = string<br>  }))</pre> | `[]` | no |
| <a name="input_token_name"></a> [token\_name](#input\_token\_name) | The name of the token to be stored in Vault | `string` | `"token"` | no |
| <a name="input_vault_secret_path"></a> [vault\_secret\_path](#input\_vault\_secret\_path) | The path in Vault where the team token will be stored | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_project_workspaces"></a> [project\_workspaces](#output\_project\_workspaces) | n/a |
| <a name="output_projects"></a> [projects](#output\_projects) | Output block to output the fetched projects |
| <a name="output_team_id"></a> [team\_id](#output\_team\_id) | The ID of the created team |
| <a name="output_workspaces"></a> [workspaces](#output\_workspaces) | Output block to output the fetched workspaces |
<!-- END_TF_DOCS -->

## Examples

This repository contains example configurations to help you understand how to use this module. You can find these examples in the `examples` directory.

### Basic Usage

The `examples/basic_usage` directory contains a basic example configuration for using the module. It provides a simple example of creating a team and assigning workspaces.

### Advanced Usage

The `examples/advanced_usage` directory contains an advanced example configuration for using the module. It provides an example of managing team access to TFE projects and workspaces.
