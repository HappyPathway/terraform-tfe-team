variable "team_name" {
  description = "The name of the team"
  type        = string
}

variable "organization" {
  description = "The name of the organization"
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
