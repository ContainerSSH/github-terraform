terraform {
  backend "remote" {
    organization = "ContainerSSH"

    workspaces {
      name = "github-terraform"
    }
  }
}