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
    "sshserver-auditlog": "Auditlog integration for the SSH server library"
    "log": "Common logging interface for ContainerSSH modules",
    "auditlog": "Audit logger for ContainerSSH",
  }
}