data "yandex_compute_image" "ubuntu" {
  family = var.wm_web_img
}

resource "yandex_compute_instance" "web" {
  name                      = local.vm1_name
  allow_stopping_for_update = true
  zone                      = var.default_zone
  platform_id               = var.platform_id
  resources {
    cores         = var.vms_resources.web.cores
    memory        = var.vms_resources.web.memory
    core_fraction = var.vms_resources.web.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = var.vms_resources.web.hdd_size
      type     = var.vms_resources.web.hdd_type
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.sub-develop.id
    nat       = true
  }

  metadata = var.metadata

}

resource "yandex_compute_instance" "db" {
  name                      = local.vm2_name
  allow_stopping_for_update = true
  zone                      = var.default_zone2
  platform_id               = var.platform_id
  resources {
    cores         = var.vms_resources.db.cores
    memory        = var.vms_resources.db.memory
    core_fraction = var.vms_resources.db.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = var.vms_resources.db.hdd_size
      type     = var.vms_resources.db.hdd_type
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.sub-develop2.id
    nat       = true
  }

  metadata = var.metadata

}
