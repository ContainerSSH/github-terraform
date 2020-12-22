variable "organization" {
  default = "ContainerSSH"
}

variable "token" {
  description = "GitHub access token"
}

variable "docker_username" {
  description = "Docker Hub username"
}

variable "docker_password" {
  description = "Docker Hub password"
}

variable "quay_username" {
  description = "Quay.io username"
}

variable "quay_password" {
  description = "Quay.io password"
}

locals {
  members = [
    "janoszen",
    "sanjabonic"
  ]
  libraries = {
    "agent": "The guest agent for ContainerSSH",
    "service" : "Service layer for ContainerSSH",
    "geoip" : "The GeoIP lookup library for ContainerSSH",
    "dockerrun" : "The legacy Docker backend for ContainerSSH",
    "docker" : "The Docker backend for ContainerSSH",
    "kuberun" : "The legacy Kubernetes backend for ContainerSSH",
    "kubernetes" : "The Kubernetes backend for ContainerSSH",
    "backend" : "Container backend abstraction library for ContainerSSH",
    "metrics" : "Metrics collection and server library for ContainerSSH",
    "configuration" : "Common configuration library for ContainerSSH",
    "http" : "Common HTTP library for ContainerSSH",
    "auth" : "ContainerSSH authentication library",
    "authintegration" : "SSH server integration of the auth library"
    "sshserver" : "The SSH server and decoding library used by ContainerSSH",
    "auditlogintegration" : "Auditlog integration for the SSH server library"
    "log" : "Common logging interface for ContainerSSH modules",
    "auditlog" : "Audit logger for ContainerSSH",
    "structutils" : "Utility wrapper for structs for ContainerSSH",
    "unixutils" : "Utilities related to UNIX systems",
  }
}
