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

#SERVICE ACC VARS
/* variable "sa_name" {
  type        = string
  default     = "obj-stor-sa"
} */

variable "sa_id" {
  type        = string
  default     = "aje0h9cpu8acmjc4k6kc"
}

#KMS KEY VARS
variable "kms_key_name"  {
  type        = string
  default     = "kms-key"
}

variable "default_algorithm" {
  type        = string
  default     = "AES_128"
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


