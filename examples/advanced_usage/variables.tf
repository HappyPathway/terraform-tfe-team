variable "team_name" {
  description = "The name of the team"
  type        = string
}

variable "organization" {
  description = "The name of the organization"
  type        = string
}

variable "tfe_projects" {
  description = "A list of projects to create"
  type = list(object({
    name         = string
    access_level = string
    project_access = optional(object({
      settings = optional(string, "read")
      teams    = optional(string, "none")
    }), null)
    workspace_access = optional(object({
      state_versions = optional(string, "none")
      sentinel_mocks = optional(string, "none")
      runs           = optional(string, "read")
      variables      = optional(string, "none")
      create         = optional(bool, false)
      locking        = optional(bool, false)
      move           = optional(bool, false)
      delete         = optional(bool, false)
      run_tasks      = optional(bool, false)
    }), null)
  }))
  default = []
}

variable "tfe_workspaces" {
  description = "A list of workspaces to create"
  type = list(object({
    name         = string
    access_level = string
  }))
  default = []
}
