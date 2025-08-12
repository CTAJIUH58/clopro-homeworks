
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

data "yandex_iam_service_account" "testsesrvacc" {
  service_account_id = var.sa_id
}

resource "yandex_storage_bucket" "mystorage" {
  bucket                = "${var.student_name}-${formatdate("YYYYMMDD", timestamp())}"
#  access_key            = yandex_iam_service_account_static_access_key.static-key.access_key
#  secret_key            = yandex_iam_service_account_static_access_key.static-key.secret_key
  acl                   = var.acl
}

resource "yandex_storage_object" "image" {
#  access_key            = yandex_iam_service_account_static_access_key.static-key.access_key
#  secret_key            = yandex_iam_service_account_static_access_key.static-key.secret_key
  bucket = "${var.student_name}-${formatdate("YYYYMMDD", timestamp())}"
  key    = var.image_file_name
  source = var.image_file_path
  depends_on = [yandex_storage_bucket.mystorage]
  acl    = var.acl
}

resource "yandex_compute_instance_group" "web_group" {
  name = var.web_name
  service_account_id = data.yandex_iam_service_account.testsesrvacc.id
  instance_template {
    platform_id = var.web_platform   
    resources {
      memory = var.web_memory
      cores  = var.web_cores
      core_fraction = var.web_core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = var.web_disk_image_id
      size     = var.web_disk_size
    }
  }
  network_interface {
    subnet_ids = [yandex_vpc_subnet.public_subnet.id]
    nat = var.web_nat
  }  
  scheduling_policy {
    preemptible = var.web_scheduling_policy
  }

  metadata = {
      user-data = "${file("./cloud-conf.yaml")}"
   }
  }
  
  scale_policy {
    fixed_scale {
      size = var.web_size
    }
  }

  deploy_policy {
    max_unavailable = var.web_max_unavailable
    max_expansion   = var.web_max_expansion
  }

  health_check {
    interval = var.web_interval
    timeout  = var.web_timeout
    healthy_threshold   = var.web_healthy_threshold
    unhealthy_threshold = var.web_unhealthy_threshold
    tcp_options {
      port = var.web_port
    }
  }

  allocation_policy {
    zones = [var.default_zone]
  }

  load_balancer {
        target_group_name = "web-group"
  }
}

resource "yandex_lb_network_load_balancer" "balancer" {
  name        = var.balancer_name
  folder_id   = var.folder_id
  listener {
    name = var.balancer_listener_name
    port = var.balancer_listener_port
    external_address_spec {
      ip_version = "ipv4"
    }
  }
attached_target_group {
    target_group_id = yandex_compute_instance_group.web_group.load_balancer.0.target_group_id
    healthcheck {
      name = var.balancer_listener_name
      interval = var.balancer_interval
      timeout = var.balancer_timeout
      unhealthy_threshold = var.web_unhealthy_threshold
      healthy_threshold = var.web_healthy_threshold
      http_options {
        port = var.balancer_listener_port
        path = "/"
      }
    }
  }
}

