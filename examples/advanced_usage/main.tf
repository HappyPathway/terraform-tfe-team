provider "tfe" {
  version = "0.63.0"
}

module "tfe_team" {
  source = "../../"

  team_name      = var.team_name
  organization   = var.organization
  tfe_projects   = var.tfe_projects
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
