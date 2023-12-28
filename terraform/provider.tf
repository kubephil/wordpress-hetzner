terraform {
    required_providers {
        hetznerdns = {
            source = "timohirt/hetznerdns"
            version = "2.2.0"
        }
        hcloud = {
            source = "hetznercloud/hcloud"
            version = "1.44.1"
        }
        local = {
            source = "hashicorp/local"
            version = "2.4.1"
        }

    }
    required_version = ">= 1.0.0"
}

provider "hcloud" {
    token = var.hcloud_token
}

provider "hetznerdns" {
    apitoken = var.hetznerdns_token
  
}
provider "local" {
  
}
