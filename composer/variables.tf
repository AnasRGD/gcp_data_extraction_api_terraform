variable "work_bucket_composer_name" {
  type = string
  description = "The name of Airflow work bucket"
}

variable "backup_bucket_composer_name" {
  type = string
  description = "The name of Airflow backup bucket"
}

variable "extraction_dataset" {
  type = string
  description = "The Dataset name to track object creation and deletion"
  default = "EXTRACTION"
}


variable "terraform_service_account_email" {
  type = string
  description = "The email of the service account used by terraform"
}
