# outputs

output "internal_ip_address_nat-1" {
  value = yandex_compute_instance.nat-1.network_interface.0.ip_address
}

output "external_ip_address_nat-1" {
  value = yandex_compute_instance.nat-1.network_interface.0.nat_ip_address
}

output "internal_ip_address_vm_2" {
  value = yandex_compute_instance.vm-2.network_interface.0.ip_address
}

output "external_ip_address_vm_2 {
  value = yandex_compute_instance.vm_2.network_interface.0.nat_ip_address
}

output "internal_ip_address_station-2" {
  value = yandex_compute_instance.station-2.network_interface.0.ip_address
}


