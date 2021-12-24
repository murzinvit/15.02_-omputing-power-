resource "yandex_storage_bucket" "murzin241121" {
  access_key = var.bucket_access_key
  secret_key = var.bucket_secret_key
  acl        = "private"
  bucket     = "murzin241121"
}


resource "yandex_storage_object" "images-object" {
  access_key = var.bucket_access_key
  secret_key = var.bucket_secret_key
  bucket     = "murzin241121"
  acl        = "private"
  key        = "Americano"
  source     = "images/Americano.jpg"
}

