resource "yandex_storage_bucket" "ioakim" {
  access_key = var.bucket_access_key
  secret_key = var.bucket_secret_key
  bucket     = "ioakim"
  acl        = "public-read"
  website {
    index_document = "files/index.html"
  }
}

resource "yandex_storage_object" "index-object" {
  access_key = var.bucket_access_key
  secret_key = var.bucket_secret_key
  bucket     = "ioakim"
  key        = "index.html"
  source     = "files/index.html"
}

resource "yandex_storage_object" "image-object" {
  access_key = var.bucket_access_key
  secret_key = var.bucket_secret_key
  bucket     = "ioakim"
  key        = "americano"
  source     = "files/americano.jpg"
}


