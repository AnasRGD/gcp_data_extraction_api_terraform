data "google_compute_default_service_account" "default" {
}

resource "google_service_account" "sa-airflow" {
  account_id   = "sa-airflow"
  display_name = "Service account to access GCS and Bigquery tables via Airflow"
}

resource "google_project_iam_member" "sa-airflow_access_bigquery_admin" {
  project = data.google_project.current_project.project_id
  role    = "roles/bigquery.dataEditor"
  member  = "serviceAccount:${google_service_account.sa-airflow.email}"
}

resource "google_project_iam_member" "sa-airflow_access_job_user" {
  project = data.google_project.current_project.project_id
  role    = "roles/bigquery.jobUser"
  member  = "serviceAccount:${google_service_account.sa-airflow.email}"
}

resource "google_project_iam_member" "sa-airflow_access_storage_admin" {
  project = data.google_project.current_project.project_id
  role    = "roles/storage.admin"
  member  = "serviceAccount:${google_service_account.sa-airflow.email}"
}