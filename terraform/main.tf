
resource "hcloud_ssh_key" "ssh_key" {
    name = "ssh_key"
    public_key = file(var.ssh_key_location)
}

resource "hcloud_server" "server" {
    name = var.server_name
    image = var.os_image
    server_type = var.hcloud_server_type
    location = var.hcloud_location
    ssh_keys = [hcloud_ssh_key.ssh_key.id]
}

resource "hetznerdns_record" "record" {
    zone_id = var.hetznerdns_zone_id
    name = var.server_name
    type = "A"
    value = hcloud_server.server.ipv4_address
    ttl = 3600
}


output "ipv4_address" {
    value = hcloud_server.server.ipv4_address
}

output "ssh_command" {
    value = "ssh root@${hcloud_server.server.ipv4_address}"
}

