output "team_id" {
  description = "The ID of the created team"
  value       = local.tfe_team.id
}

# Output block to output the fetched projects
output "projects" {
  value = [for project in var.tfe_projects : lookup(data.tfe_project.projects, project.name)] # Output the list of projects
}

# Output block to output the fetched workspaces
output "workspaces" {
  value = [for workspace in var.tfe_workspaces : lookup(data.tfe_workspace.workspaces, workspace.name)] # Output the list of workspaces
}

output "project_workspaces" {
  value = [for project in var.tfe_projects : lookup(data.tfe_project.projects, project.name).workspace_ids] # Output the list of projects
}