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
    "geoip": "The GeoIP lookup library for ContainerSSH",
    "logintegration": "The logging integration library for ContainerSSH",
    "dockerrun": "The Docker backend for ContainerSSH",
    "kuberun": "The Kubernetes backend for ContainerSSH",
    "backend": "Container backend abstraction library for ContainerSSH",
    "metrics": "Metrics collection and server library for ContainerSSH",
    "configuration": "Common configuration library for ContainerSSH",
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
