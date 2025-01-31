# Data block to fetch TFE workspaces based on the names provided in the variable `var.tfe_workspaces`
data "tfe_workspace" "workspaces" {
  for_each     = toset([for workspace in var.tfe_workspaces : workspace.name]) # Iterate over each workspace name
  name         = each.value                                                    # Set the name of the workspace
  organization = var.organization                                              # Set the organization for the workspace
}

# Resource block to set team access for each workspace
resource "tfe_team_access" "workspaces" {
  for_each     = tomap({ for workspace in var.tfe_workspaces : workspace.name => workspace.access_level }) # Map workspace names to their access levels
  access       = each.value                                                                                # Set the access level for the team
  team_id      = local.tfe_team.id                                                                         # Lookup the team ID based on the workspace name
  workspace_id = lookup(data.tfe_workspace.workspaces, each.key).id                                        # Set the workspace ID (assuming `tfe_workspace.test` is defined elsewhere)
}