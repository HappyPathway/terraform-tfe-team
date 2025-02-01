provider "tfe" {
  version = "0.63.0"
}

module "tfe_team" {
  source = "../../"

  team_name      = var.team_name
  organization   = var.organization
  tfe_projects   = [
    {
      name = "project1"
      access_level = "read"
      project_access = {
        settings = "read"
        teams    = "none"
      }
      workspace_access = {
        state_versions = "none"
        sentinel_mocks = "none"
        runs           = "read"
        variables      = "none"
        create         = false
        locking        = false
        move           = false
        delete         = false
        run_tasks      = false
      }
    },
    {
      name = "project2"
      access_level = "write"
      project_access = {
        settings = "write"
        teams    = "read"
      }
      workspace_access = {
        state_versions = "read"
        sentinel_mocks = "read"
        runs           = "write"
        variables      = "read"
        create         = true
        locking        = true
        move           = true
        delete         = true
        run_tasks      = true
      }
    }
  ]
  tfe_workspaces = var.tfe_workspaces
}

output "team_id" {
  description = "The ID of the created team"
  value       = module.tfe_team.team_id
}

output "projects" {
  description = "The list of projects assigned to the team"
  value       = module.tfe_team.projects
}

output "workspaces" {
  description = "The list of workspaces assigned to the team"
  value       = module.tfe_team.workspaces
}
