# Values are set in Terraform Cloud

variable "do_api_token" {
    description = "DigitalOcean API token"
}

variable "ssh_key_default" {
    description = "Default public SSH key"
}

variable "base_master_image_id" {
    description = "Image ID for base master"
}

variable "base_minion_image_id" {
    description = "Image ID for base minion"
}
