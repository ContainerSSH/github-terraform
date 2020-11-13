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
    "http": "Common HTTP library for ContainerSSH",
    "auth": "ContainerSSH authentication library",
    "authintegration": "SSH server integration of the auth library"
    "github-terraform": "Terraform repository for managing this GitHub organization"
    "sshserver": "The SSH server and decoding library used by ContainerSSH",
    "auditlogintegration": "Auditlog integration for the SSH server library"
    "log": "Common logging interface for ContainerSSH modules",
    "auditlog": "Audit logger for ContainerSSH",
  }
}
