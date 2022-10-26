resource "google_storage_bucket" "composer-work" {
  name          = var.work_bucket_composer_name
  location      = "EU"
  uniform_bucket_level_access = true
  lifecycle_rule {
    condition {
      age = 365
    }
    action {
      type = "SetStorageClass"
      storage_class = "ARCHIVE"
    }
  }

}


resource "google_storage_bucket" "composer-backup" {
  name          = var.backup_bucket_composer_name
  location      = "EU"
  uniform_bucket_level_access = true
  lifecycle_rule {
    condition {
      age = 730
    }
    action {
      type = "SetStorageClass"
      storage_class = "ARCHIVE"
    }
  }

}
