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

resource "digitalocean_ssh_key" "default" {
  name       = "Default SSH key"
  public_key = var.ssh_key_default
}

resource "digitalocean_droplet" "saltmaster" {
  image    = "fedora-32-x64"
  name     = "saltmaster"
  region   = "fra1"
  size     = "s-1vcpu-1gb"
  ssh_keys = [digitalocean_ssh_key.default.fingerprint]
  vpc_uuid = digitalocean_vpc.blog-vpc.id

  connection {
    host = self.ipv4_address
    user = "root"
    type = "ssh"
    private_key = var.ssh_key_default_priv
    timeout = "2m"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo dnf -y upgrade --refresh",
      "sudo dnf -y install salt-master",
      "sudo systemctl enable salt-master",
      "sudo systemctl start salt-master"
    ]
  }
}
