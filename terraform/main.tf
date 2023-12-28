
resource "hcloud_ssh_key" "ssh_key" {
    name = "ssh_key"
    public_key = file(var.ssh_key_location)
}

resource "hcloud_firewall" "firewall" {
    name = "default-firewall"

    rule {
    direction = "in"
    protocol  = "tcp"
    port      = "22"
    source_ips = ["0.0.0.0/0", "::/0"]  # Allows from any IP, adjust if you have a static IP
  }

  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "80"
    source_ips = ["0.0.0.0/0", "::/0"]
  }

  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "443"
    source_ips = ["0.0.0.0/0", "::/0"]
  }
  
}

resource "hcloud_server" "server" {
    name = var.server_name
    image = var.os_image
    server_type = var.hcloud_server_type
    location = var.hcloud_location
    ssh_keys = [hcloud_ssh_key.ssh_key.id]
    user_data = file("${path.module}/cloud-init.yml")
    firewall_ids = [hcloud_firewall.firewall.id]
    backups = var.enable_backups

}

resource "hetznerdns_record" "record" {
    zone_id = var.hetznerdns_zone_id
    name = var.server_name
    type = "A"
    value = hcloud_server.server.ipv4_address
    ttl = 3600
}
resource "local_file" "ansible_inventory_file" {
  content  = "[all]\n${hcloud_server.server.name} ansible_host=${hcloud_server.server.ipv4_address}"
  filename = "${path.module}/../ansible/inventory.ini"
}