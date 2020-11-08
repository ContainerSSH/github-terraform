variable "organization" {
  default = "ContainerSSH"
}

variable "token" {

}

locals {
  members = [
    "janoszen",
    "sanjabonic"
  ]
  libraries = {
    "github-terraform": "Terraform repository for managing this GitHub organization"
    "sshserver": "The SSH server and decoding library used by ContainerSSH",
    "log": "Common logging interface for ContainerSSH modules",
    "auditlog": "Audit logger for ContainerSSH",
  }
}