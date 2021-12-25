resource "yandex_iam_service_account" "instances" {
  name        = "instances"
  description = "service account to manage VMs"
}

resource "yandex_resourcemanager_folder_iam_binding" "editor" {
  folder_id = var.folder_id
  role = "editor"
  members = [
    "serviceAccount:${yandex_iam_service_account.instances.id}",
  ]
}

resource "yandex_compute_instance_group" "group1" {
  name               = "test-ig"
  folder_id           = var.folder_id
  deletion_protection = false
  service_account_id  = "${yandex_iam_service_account.instances.id}"
  instance_template {
    platform_id = "standard-v1"
    resources {
      memory = 2
      cores  = 2
    }
    boot_disk {
      mode = "READ_WRITE"
      initialize_params {
        image_id = "fd827b91d99psvq5fjit"
        size = 4
      }
    }
    network_interface {
      network_id = yandex_vpc_network.network-1.id
      subnet_ids = [yandex_vpc_subnet.subnet-1.id]
      nat = true
    }

    metadata = {
       user-data = "${file("meta.txt")}"
    }
  }

  scale_policy {
    fixed_scale {
       size = 3
    }
  }

  allocation_policy {
    zones = ["ru-central1-a"]
  }

  deploy_policy {
    max_unavailable = 2
    max_creating    = 2
    max_expansion   = 2
    max_deleting    = 2
  }

}
