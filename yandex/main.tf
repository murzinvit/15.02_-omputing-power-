##########
# instance
##########

data "yandex_compute_image" "ubuntu_image" {
  family = "ubuntu-1804-lts"
}

resource "yandex_compute_instance" "vm-1" {
  name = var.vm_name

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = var.nat_image
    }
  }

  network_interface {
    subnet_id  = yandex_vpc_subnet.subnet-1.id
    nat        = true
    ip_address = var.internal_nat_ip
  }

  metadata = {
    user-data = "${file("meta.txt")}"
  }
}

resource "yandex_compute_instance" "vm-2" {
  name = var.vm2_name

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = var.vm2_image
    }
  }

  network_interface {
    subnet_id  = yandex_vpc_subnet.subnet-1.id
    nat        = true
    ip_address = var.vm2_ip
  }

  metadata = {
    user-data = "${file("meta.txt")}"
  }
}


resource "yandex_compute_instance" "station-2" {
  name = "station-2"
  zone = "ru-central1-a"
  hostname = "station-2"
  platform_id = "standard-v1"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu_image.id
      size = 10
    }
  }

  network_interface {
    subnet_id  = yandex_vpc_subnet.subnet-2.id
    ip_address = "192.168.20.20"
  }

  metadata = {
    user-data = "${file("meta.txt")}"
  }
}
