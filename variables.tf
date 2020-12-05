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
    "service" : "Service layer for ContainerSSH",
    "serviceintegration" : "Service registry for ContainerSSH",
    "geoip" : "The GeoIP lookup library for ContainerSSH",
    "logintegration" : "The logging integration library for ContainerSSH",
    "dockerrun" : "The Docker backend for ContainerSSH",
    "kuberun" : "The Kubernetes backend for ContainerSSH",
    "backend" : "Container backend abstraction library for ContainerSSH",
    "metrics" : "Metrics collection and server library for ContainerSSH",
    "metricsintegration" : "Integration for the Metrics library for ContainerSSH",
    "configuration" : "Common configuration library for ContainerSSH",
    "http" : "Common HTTP library for ContainerSSH",
    "auth" : "ContainerSSH authentication library",
    "authintegration" : "SSH server integration of the auth library"
    "sshserver" : "The SSH server and decoding library used by ContainerSSH",
    "sshserverintegration" : "Integration library for the SSH server library for ContainerSSH"
    "auditlogintegration" : "Auditlog integration for the SSH server library"
    "log" : "Common logging interface for ContainerSSH modules",
    "auditlog" : "Audit logger for ContainerSSH",
    "structutils" : "Utilitiy wrapper for structs for ContainerSSH",
    "unixutils" : "Utilities related to UNIX systems", 
  }
}
