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

variable "gpg_code_signing_key" {
  description = "Code signing GPG key"
}

locals {
  # ContainerSSH project chairs
  chairs = [
    "janosdebugs",
    "bencurio",
    "tsipinakis",
  ]
  # The following people are members, but not chairs of the working group
  members = [
    # LF members, not actually part of the working group
    "thelinuxfoundation",
    "caniszczyk",
  ]
  # These are the working group members
  workinggroup = concat(local.members, local.chairs)
  # These are the machine users
  bots = [
    # containersshbuilder is a machine user used to execute Terraform code. This allows programmatic creation of
    # repositories and automated permission management.
    "containersshbuilder"
  ]
  # The admins list is maintained separately because it isn't treated as a set, rather as a list.
  admins = [
    "janosdebugs",
    "bencurio",
    "containersshbuilder",
    "tsipinakis",
    "thelinuxfoundation",
    "caniszczyk",
  ]

  libraries = {
    "service" : "Service layer for ContainerSSH",
    "geoip" : "The GeoIP lookup library for ContainerSSH",
    "dockerrun" : "The legacy Docker backend for ContainerSSH",
    "docker" : "The Docker backend for ContainerSSH",
    "kuberun" : "The legacy Kubernetes backend for ContainerSSH",
    "kubernetes" : "The Kubernetes backend for ContainerSSH",
    "backend" : "Container backend abstraction library for ContainerSSH",
    "metrics" : "Metrics collection and server library for ContainerSSH",
    "metricsintegration" : "SSH integration for metrics collection for ContainerSSH",
    "configuration" : "Common configuration library for ContainerSSH",
    "http" : "Common HTTP library for ContainerSSH",
    "auth" : "ContainerSSH authentication library",
    "authintegration" : "SSH server integration of the auth library"
    "sshserver" : "The SSH server and decoding library used by ContainerSSH",
    "security" : "The security layer for ContainerSSH",
    "auditlogintegration" : "Auditlog integration for the SSH server library"
    "log" : "Common logging interface for ContainerSSH modules",
    "auditlog" : "Audit logger for ContainerSSH",
    "structutils" : "Utility wrapper for structs for ContainerSSH",
    "unixutils" : "Utilities related to UNIX systems",
    "sshproxy" : "SSH proxy backend for ContainerSSH",
    "client-testbed" : "Miniature testbed application for SSH clients",
    "health" : "Healthz server for ContainerSSH",
    "test" : "Test helpers for ContainerSSH",
  }
  archived = [
    "kuberun",
    "dockerrun",
    "service",
    "geoip",
    "docker",
    "kubernetes",
    "backend",
    "metrics",
    "metricsintegration",
    "configuration",
    "http",
    "auth",
    "authintegration",
    "sshserver",
    "security",
    "auditlogintegration",
    "log",
    "auditlog",
    "structutils",
    "unixutils",
    "sshproxy",
    "client-testbed",
    "health",
    "test"
  ]
}
