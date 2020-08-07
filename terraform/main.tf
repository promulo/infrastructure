provider "digitalocean" {
    token = var.do_api_token
}

resource "digitalocean_project" "blog" {
  name        = "blog"
  description = "My own hosted instance of WriteFreely"
  purpose     = "Website or blog"
  environment = "Development"
}

resource "digitalocean_vpc" "blog-vpc" {
  name     = "blog-network"
  region   = "fra1"
  ip_range = "10.0.0.0/24"
}

resource "digitalocean_ssh_key" "paulo" {
  name       = "Paulo SSH key"
  public_key = var.ssh_key_paulo
}
