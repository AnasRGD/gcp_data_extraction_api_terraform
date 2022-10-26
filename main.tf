provider "google" {
    region= "europe-west1"
    project= var.project_id
    credentials = file("ar-data-extraction-assignement-8c5e8c8577e8.json")
}

data "google_service_account" "terraform" {
  account_id = "terraform-service-account"
}

data "google_project" "current_project" {
}


module "composer" {
  source                          = "./composer"
  work_bucket_composer_name       = var.work_bucket_composer_name
  backup_bucket_composer_name     = var.backup_bucket_composer_name
  terraform_service_account_email = data.google_service_account.terraform.email
}
