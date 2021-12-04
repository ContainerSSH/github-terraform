terraform {
  backend "remote" {
    organization = "ContainerSSH"

    workspaces {
      name = "github-terraform"
    }
  }
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
}

provider "github" {
  token = var.token
  owner = var.organization
}

