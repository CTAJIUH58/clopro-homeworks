#PROVIDER VARS
variable "cloud_id" {
  type        = string
  default     = "b1ge8ac59kbr0jvvl38e"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = "b1g9e0n72sa8lujhtbln"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

#SUBNET VARS 
variable "vpc_name" {
  type        = string
  default     = "my-vpc"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "subnet_name" {
  type        = string
  default     = "public"
}

variable "v4_cidr_blocks" {
  type        = list(string)
  default     = ["192.168.10.0/24"]
}

variable "subnet_zone" {
  type        = string
  default     = "ru-central1-a"
}

#SERVICE ACC VARS
/* variable "sa_name" {
  type        = string
  default     = "obj-stor-sa"
} */

variable "sa_id" {
  type        = string
  default     = "aje0h9cpu8acmjc4k6kc"
}

#OBJECT STORAGE VARS
variable "student_name" {
  type        = string
  default     = "sergei-ershov"
}

variable "acl" {
  type        = string
  default     = "public-read"
}

variable "image_file_name" {
  type        = string
  default     = "image.jpg"
}

variable "image_file_path" {
  type        = string
  default     = "/home/hostuser/netoHome/clopro-homeworks/15.2/img/image.jpg"
}

#WEB VARS
variable "web_name" {
  type        = string
  default     = "web-group"
}
  

variable "web_platform" {
  type        = string
  default     = "standard-v1"
}

variable "web_memory" {
  type        = number
  default     = 2
}

variable "web_cores" {
  type        = number
  default     = 2
}

variable "web_core_fraction" {
  type        = number
  default     = "20"
}


variable "web_disk_image_id" {
  type        = string
  default     = "fd827b91d99psvq5fjit"
}

variable "web_disk_size" {
  type        = number
  default     = "10"
}

variable "web_scheduling_policy" {
  type        = bool
  default     = "true"
}

variable "web_size" {
  type        = number
  default     = 3
}

variable "web_max_unavailable" {
  type        = number
  default     = 1
}

variable "web_max_expansion" {
  type        = number
  default     = 3
}

variable "web_interval" {
  type        = number
  default     = 30
}

variable "web_timeout" {
  type        = number
  default     = 15
}

variable "web_healthy_threshold" {
  type        = number
  default     = 2
}

variable "web_unhealthy_threshold" {
  type        = number
  default     = 5
}

variable "web_port" {
  type        = number
  default     = 80
}

variable "web_nat" {
  type        = bool
  default     = "true"
}

#Network Load Balancer VARS
variable "balancer_name" {
  type        = string
  default     = "web-balancer"
}


variable "balancer_listener_name" {
  type        = string
  default     = "http"
}

variable "balancer_listener_port" {
  type        = number
  default     = 80
}

variable "balancer_interval" {
  type        = number
  default     = 2
}

variable "balancer_timeout" {
  type        = number
  default     = 1
}

