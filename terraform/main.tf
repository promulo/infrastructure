provider "digitalocean" {
    token = var.do_api_token
}

// FIXME: remove this resource from Terraform
resource "digitalocean_vpc" "blog-vpc" {
  name     = "blog-network"
  region   = "fra1"
  ip_range = "10.0.0.0/24"
}

resource "digitalocean_vpc" "default" {
  name     = "default-network"
  region   = "fra1"
  ip_range = "10.1.0.0/24"
}

resource "digitalocean_ssh_key" "default" {
  name       = "Default SSH key"
  public_key = var.ssh_key_default
}

resource "digitalocean_project" "core" {
  name        = "core"
  description = "Core infrastructure resources"
  purpose     = "Operational / Developer tooling"
}

resource "digitalocean_droplet" "saltmaster" {
  image    = var.base_master_image_id
  name     = "salt"
  region   = "fra1"
  size     = "s-1vcpu-1gb"
  ssh_keys = [
    digitalocean_ssh_key.default.fingerprint
  ]
  private_networking = true
  vpc_uuid = digitalocean_vpc.default.id
}

resource "digitalocean_droplet" "minikube" {
  image    = var.base_minion_image_id
  name     = "minikube"
  region   = "fra1"
  size     = "s-2vcpu-2gb"
  ssh_keys = [
    digitalocean_ssh_key.default.fingerprint
  ]
  private_networking = true
  vpc_uuid = digitalocean_vpc.default.id
}

resource "digitalocean_project_resources" "core_resources" {
  project = digitalocean_project.core.id
  resources = [
    digitalocean_droplet.saltmaster.urn,
    digitalocean_droplet.minikube.urn
  ]
}
