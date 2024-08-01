output "ip_addresses" {

  value = [
    { web = ["ssh -o 'StrictHostKeyChecking=no' ubuntu@${yandex_compute_instance.web.network_interface[0].nat_ip_address}", yandex_compute_instance.web.network_interface[0].ip_address] },
    { db = ["ssh -o 'StrictHostKeyChecking=no' ubuntu@${yandex_compute_instance.db.network_interface[0].nat_ip_address}", yandex_compute_instance.db.network_interface[0].ip_address] },
  ]
}