resource "tfe_team" "team" {
  count        = var.create_team ? 1 : 0
  name         = var.team_name
  organization = var.organization
}

data "tfe_team" "team" {
  count        = var.create_team ? 0 : 1
  name         = var.team_name
  organization = var.organization
}

locals {
  tfe_team = var.create_team ? one(tfe_team.team) : one(data.tfe_team.team)
}

resource "tfe_team_token" "team_token" {
  team_id = local.tfe_team.id
}

resource "tfe_team_members" "team_members" {
  team_id   = local.tfe_team.id
  usernames = var.team_members
}

resource "vault_generic_secret" "team_token_secret" {
  path = var.vault_secret_path

  data_json = jsonencode({
    token = tfe_team_token.team_token.token
  })
}
