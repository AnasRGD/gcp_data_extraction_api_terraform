variable "project_id" {
  description = "The project id of the GCP project"
  type = string
}

variable "work_bucket_composer_name" {
  type = string
  description = "The name of Airflow work bucket"
}

variable "backup_bucket_composer_name" {
  type = string
  description = "The name of Airflow backup bucket"
}

