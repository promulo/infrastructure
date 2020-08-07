# Values are set in Terraform Cloud

variable "do_api_token" {
    description = "DigitalOcean API token"
}

variable "ssh_key_default" {
    description = "Default public SSH key"
}

variable "ssh_key_default_priv" {
    description = "Default private SSH key (for provision)"
}
