resource "tfe_team" "team" {
  name         = var.team_name
  organization = var.organization
}

resource "tfe_team_token" "team_token" {
  team_id = tfe_team.team.id
}

resource "tfe_team_members" "team_members" {
  team_id   = tfe_team.team.id
  usernames = var.team_members
}

resource "vault_generic_secret" "team_token_secret" {
  path = var.vault_secret_path

  data_json = jsonencode({
    token = tfe_team_token.team_token.token
  })
}
