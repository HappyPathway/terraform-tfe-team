terraform {
  required_providers {
    vault = {
      source = "hashicorp/vault"
      # https://github.com/hashicorp/terraform-provider-vault/releases
      version = "~> 3.4"
    }
  }
}