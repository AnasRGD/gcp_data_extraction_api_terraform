resource "google_bigquery_dataset" "extraction" {
  dataset_id                  = var.extraction_dataset
  description                 = "Dataset used to log Airflow Bigquery jobs"
  location                    = "EU"
}

resource "google_logging_project_sink" "instance_sink" {
  name        = "airflow_extract_stats"
  description = "Results of Airflow BigQuery job ran for extraction"
  destination = "bigquery.googleapis.com/${google_bigquery_dataset.extraction.id}"
  filter      = "resource.type=\"bigquery_resource\" \nprotoPayload.requestMetadata.callerSuppliedUserAgent:\"airflow\"\nprotoPayload.methodName=\"jobservice.jobcompleted\" \nprotoPayload.serviceData.jobCompletedEvent.job.jobConfiguration.query.destinationTable.datasetId=${google_bigquery_dataset.extraction.dataset_id}"

  unique_writer_identity = true
  bigquery_options {
    use_partitioned_tables = true
  }

}

resource "google_bigquery_dataset_iam_member" "editor" {
  dataset_id = google_bigquery_dataset.extraction.dataset_id
  role       = "roles/bigquery.dataEditor"
  member     = google_logging_project_sink.instance_sink.writer_identity
}
