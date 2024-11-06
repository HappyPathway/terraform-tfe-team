# Data block to fetch TFE projects based on the names provided in the variable `var.tfe_projects`
data "tfe_project" "projects" {
  for_each     = toset([for project in var.tfe_projects : project.name]) # Iterate over each project name
  name         = each.value                                              # Set the name of the project
  organization = var.organization                                        # Set the organization for the project
}

# Resource block to set team access for each project
resource "tfe_team_project_access" "team_project_access" {
  for_each   = tomap({ for project in var.tfe_projects : project.name => project.access_level }) # Map project names to their access levels
  team_id    = local.tfe_team.id                                                                 # Lookup the team ID based on the project name
  project_id = lookup(data.tfe_project.project, each.key).id                                     # Set the project ID
  access     = each.value                                                                        # Set the access level for the team
}

# Output block to output the fetched projects
output "projects" {
  value = [for project in var.tfe_projects : lookup(data.tfe_project.projects, project.name)] # Output the list of projects
}
