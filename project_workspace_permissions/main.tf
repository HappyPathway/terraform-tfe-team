data "tfe_workspace" "workspaces" {
  for_each     = toset(var.workspace_names) # Iterate over each workspace name
  name         = each.value                 # Set the name of the workspace
  organization = var.organization           # Set the organization for the workspace
}

resource "tfe_team_access" "workspace_permissions" {
  for_each     = { for workspace in var.workspace_names : workspace => lookup(data.tfe_workspace.workspaces, workspace).id } # Map workspace names to their access levels
  team_id      = var.team_id
  workspace_id = each.value
  access       = var.access_level
}
