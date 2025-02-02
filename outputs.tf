output "team_id" {
  description = "The unique identifier of the created team"
  value       = local.tfe_team.id
}

output "projects" {
  description = "The list of projects assigned to the team"
  value = [for project in var.tfe_projects : data.tfe_project.projects[project.name]] 
}

output "workspaces" {
  description = "The list of workspaces assigned to the team"
  value = [for workspace in var.tfe_workspaces : data.tfe_workspace.workspaces[workspace.name]] 
}

output "project_workspaces" {
  description = "The list of workspaces associated with each project"
  value = [for project in var.tfe_projects : data.tfe_project.projects[project.name].workspace_ids] 
}
