output "ipv4_address" {
    value = hcloud_server.server.ipv4_address
}

output "ssh_command" {
    value = "ssh admin@${hcloud_server.server.ipv4_address}"
}

output "ansible_inventory" {
    value = "server ansible_host=${hcloud_server.server.ipv4_address} ansible_user=admin"
}
