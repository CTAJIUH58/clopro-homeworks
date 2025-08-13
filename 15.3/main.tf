

data "yandex_iam_service_account" "testsesrvacc" {
  service_account_id = var.sa_id
}

resource "yandex_kms_symmetric_key" "key-a" {
  name              = var.kms_key_name
  default_algorithm = var.default_algorithm
}

resource "yandex_storage_bucket" "mystorage" {
  bucket                = "${var.student_name}-${formatdate("YYYYMMDD", timestamp())}"
  acl                   = var.acl
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = yandex_kms_symmetric_key.key-a.id
        sse_algorithm     = "aws:kms"
      }
    }
  }
}

resource "yandex_storage_object" "image" {
  bucket = "${var.student_name}-${formatdate("YYYYMMDD", timestamp())}"
  key    = var.image_file_name
  source = var.image_file_path
  depends_on = [yandex_storage_bucket.mystorage]
  acl    = var.acl
}



#https://storage.yandexcloud.net/sergei-ershov-20250813/image.jpg