output "team_id" {
  description = "The ID of the created team"
  value       = local.tfe_team.id
}

output "project_id" {
  description = "The ID of the created project"
  value       = tfe_project.project.id
}
