variable "team_name" {
  description = "The name of the team"
  type        = string
}

variable "organization" {
  description = "The name of the organization"
  type        = string
}

variable "team_members" {
  description = "A list of usernames to add to the team"
  type        = list(string)
  default     = []
}

variable "vault_secret_path" {
  description = "The path in Vault where the team token will be stored"
  type        = string
}

variable "tfe_workspaces" {
  description = "A list of workspaces to create"
  type = list(object({
    name         = string
    access_level = string
  }))
  default = []
}

variable "tfe_projects" {
  description = "A list of projects to create"
  type = list(object({
    name         = string
    access_level = string
  }))
  default = []
}
