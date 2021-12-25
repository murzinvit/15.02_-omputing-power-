resource "yandex_storage_bucket" "netology" {
  access_key = var.bucket_access_key
  secret_key = var.bucket_secret_key
  bucket     = "netologybucket"
  acl        = "public-read"
  website {
    index_document = "index.html"
  }
}

resource "yandex_storage_object" "index-object" {
  access_key = var.bucket_access_key
  secret_key = var.bucket_secret_key
  acl        = "public-read"
  bucket     = "netologybucket"
  key        = "index.html"
  source     = "files/index.html"
}

resource "yandex_storage_object" "image-object" {
  access_key = var.bucket_access_key
  secret_key = var.bucket_secret_key
  acl        = "public-read"
  bucket     = "netologybucket"
  key        = "americano"
  source     = "files/americano.jpg"
}


