#SUBNETS
resource "yandex_vpc_network" "my_vpc" {
  name = var.vpc_name
}

resource "yandex_vpc_subnet" "public_subnet" {
  name           = var.subnet_name
  v4_cidr_blocks = var.v4_cidr_blocks
  zone           = var.subnet_zone
  network_id     = yandex_vpc_network.my_vpc.id
}

resource "yandex_vpc_subnet" "private_subnet" {
  name           = var.priv_subnet_name
  v4_cidr_blocks = var.priv_v4_cidr_blocks
  zone           = var.priv_subnet_zone
  network_id     = yandex_vpc_network.my_vpc.id
  route_table_id = yandex_vpc_route_table.priv_route_table.id
}

resource "yandex_vpc_route_table" "priv_route_table" {
  network_id = yandex_vpc_network.my_vpc.id

  static_route {
    destination_prefix = var.destination_prefix
    next_hop_address   = var.nat_primary_v4_address
  }
}

#VM RESOURCE
resource "yandex_compute_instance" "nat_instance" {
  name = var.nat_inst_name

  resources {
    cores  = var.nat_cores
    memory = var.nat_memory
    core_fraction = var.nat_core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = var.nat_disk_image_id
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.public_subnet.id
    nat       = var.nat
    ip_address = var.nat_primary_v4_address
  }

  scheduling_policy {
    preemptible = var.sched_pol
  }

  metadata = {
    user-data = "${file("./cloud-conf.yaml")}"
  }
}

resource "yandex_compute_instance" "public_vm" {
  name            = var.public_vm_name
  platform_id     = var.public_vm_platform
  resources {
    cores         = var.public_vm_core
    memory        = var.public_vm_memory
    core_fraction = var.public_core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = var.public_vm_image_id
      size     = var.public_vm_disk_size
    }
  }

  scheduling_policy {
    preemptible = var.scheduling_policy
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.public_subnet.id
    nat       = var.nat
  }

  metadata = {
    user-data = "${file("./cloud-conf.yaml")}"
  }
}

resource "yandex_compute_instance" "priv_vm" {
  name            = var.priv_vm_name
  platform_id     = var.priv_vm_platform

  resources {
    cores         = var.priv_vm_core
    memory        = var.priv_vm_memory
    core_fraction = var.priv_vm_core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = var.priv_vm_image_id
      size     = var.priv_vm_disk_size
    }
  }

  scheduling_policy {
    preemptible = var.priv_scheduling_policy
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.private_subnet.id
    nat       = false
  }

  metadata = {
    user-data = "${file("./cloud-conf.yaml")}"
  }
}


