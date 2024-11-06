output "team_id" {
  description = "The ID of the created team"
  value       = tfe_team.team.id
}

output "project_id" {
  description = "The ID of the created project"
  value       = tfe_project.project.id
}