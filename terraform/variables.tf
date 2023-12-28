### Required Variables
variable "hetznerdns_token" {
  type = string
  description = "Hetzner DNS API Token"
}

variable "hcloud_token" {
  type = string
  description = "Hetzner Cloud API Token"  
}

variable "hetznerdns_zone_id" {
    type = string
    description = "Hetzner DNS Zone ID. You can read it from the Hetzner DNS Web UI htto://dns.hetzner.com/zone/<zone_id>"

}

### Optional Variables
variable "hcloud_location" {
  type = string
  description = "Hetzner Cloud Location"
  default = "nbg1"
}

variable "hcloud_server_type" {
  type = string
  description = "Hetzner Cloud Server Type"
  default = "cx11"
}

# You can get the allowed values from curl -H "Authorization: Bearer $API_TOKEN" "https://api.hetzner.cloud/v1/images" 
variable "os_image" {
    type = string
    description = "Hetzner Cloud OS Image"
    default = "ubuntu-22.04"
}
variable "server_name" {
    type = string
    description = "Hetzner Cloud Server Name"
    default = "server"
  
}
variable "ssh_key_location" {
    type = string
    description = "SSH Key Location"
    default = "~/.ssh/id_rsa.pub"
}

variable "hostname" {
    type = string
    description = "Hostname.The domain is added automatically added from the DNS Zone ID. e.g for server.mydomain.com you only provide 'server' here"
    default = "server"
}