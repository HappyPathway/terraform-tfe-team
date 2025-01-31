# Data block to fetch TFE projects based on the names provided in the variable `var.tfe_projects`
data "tfe_project" "projects" {
  for_each     = toset([for project in var.tfe_projects : project.name]) # Iterate over each project name
  name         = each.value                                              # Set the name of the project
  organization = var.organization                                        # Set the organization for the project
}

# Resource block to set team access for each project
resource "tfe_team_project_access" "team_project_access" {
  for_each   = tomap({ for project in var.tfe_projects : project.name => project }) # Map project names to their project objects
  team_id    = local.tfe_team.id                                                    # Lookup the team ID based on the project name
  project_id = lookup(data.tfe_project.projects, each.key).id                       # Set the project ID
  access     = each.value.access_level                                              # Set the access level for the team

  dynamic "project_access" {
    for_each = each.value.project_access != null ? [each.value.project_access] : []
    content {
      settings = project_access.value.settings
      teams    = project_access.value.teams
    }
  }

  dynamic "workspace_access" {
    for_each = each.value.workspace_access != null ? [each.value.workspace_access] : []
    content {
      state_versions = workspace_access.value.state_versions
      sentinel_mocks = workspace_access.value.sentinel_mocks
      runs           = workspace_access.value.runs
      variables      = workspace_access.value.variables
      create         = workspace_access.value.create
      locking        = workspace_access.value.locking
      move           = workspace_access.value.move
      delete         = workspace_access.value.delete
      run_tasks      = workspace_access.value.run_tasks
    }
  }
}
