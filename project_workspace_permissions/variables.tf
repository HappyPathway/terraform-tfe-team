variable "workspace_names" {
  description = "List of workspace names"
  type        = list(string)
}

variable "access_level" {
  description = "Access level for the team"
  type        = string
}

variable "team_id" {
  description = "ID of the team"
  type        = string
}

variable "organization" {
  description = "Name of the organization"
  type        = string
}
