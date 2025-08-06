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

#VPC SUBNET VARS
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

variable "priv_subnet_name" {
  type        = string
  default     = "private"
}

variable "priv_v4_cidr_blocks" {
  type        = list(string)
  default     = ["192.168.20.0/24"]
}

variable "priv_subnet_zone" {
  type        = string
  default     = "ru-central1-a"
}

variable "destination_prefix" {
  type        = string
  default     = "0.0.0.0/0"
}

#NAT INSTANCE VARS
variable "nat_inst_name" {
  type        = string
  default     = "nat-instance"
}

variable "nat_cores" {
  type        = number
  default     = 2
}

variable "nat_core_fraction" {
  type        = number
  default     = 20
}

variable "nat_memory" {
  type        = number
  default     = 2
}

variable "nat_disk_image_id" {
  type        = string
  default     = "fd80mrhj8fl2oe87o4e1"
}

variable "nat" {
  type        = bool
  default     = true
}

variable "sched_pol" {
  type        = bool
  default     = true
}

variable "nat_primary_v4_address" {
  type        = string
  default     = "192.168.10.254"
}

#PUBLIC VM VARS
variable "public_vm_name" {
  type        = string
  default     = "public-vm"
}

variable "public_vm_platform" {
  type        = string
  default     = "standard-v1"
}

variable "public_vm_core" { 
  type        = number
  default     = "2"
}

variable "public_vm_memory" {
  type        = number
  default     = "2"
}

variable "public_core_fraction" {
  type        = number
  default     = "20"
}

variable "public_vm_disk_size" {
  type        = number
  default     = "10"
}

variable "public_vm_image_id" {
  type        = string
  default     = "fd893ak78u3rh37q3ekn"
}

variable "scheduling_policy" {
  type        = bool
  default     = "true"
}

#PRIVATE VM VARS
variable "priv_vm_name" {
  type        = string
  default     = "private-vm"
}

variable "priv_vm_platform" {
  type        = string
  default     = "standard-v1"
}

variable "priv_vm_core" {
  type        = number
  default     = "2"
}

variable "priv_vm_memory" {
  type        = number
  default     = "2"
}

variable "priv_vm_core_fraction" {
  type        = number
  default     = "20"
}

variable "priv_vm_disk_size" {
  type        = number
  default     = "10"
}

variable "priv_vm_image_id" {
  type        = string
  default     = "fd893ak78u3rh37q3ekn"
}

variable "priv_scheduling_policy" {
  type        = bool
  default     = "true" 
}

