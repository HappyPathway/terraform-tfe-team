module "workspace_permissions" {
  source          = "./project_workspace_permissions"
  for_each        = { for project in var.tfe_projects : project.name => project if project.inherit_permissions }
  workspace_names = lookup(data.tfe_project.projects, each.value.name).workspace_names
  access_level    = each.value.workspace_permissions
  team_id         = local.tfe_team.id
  organization    = var.organization
}
