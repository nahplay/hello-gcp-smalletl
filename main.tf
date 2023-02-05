resource "google_bigquery_dataset" "data_lake2" {
  dataset_id = "data_lake2"
  location = "EU"
  project = "psychic-expanse-361619"
}


resource "google_bigquery_table" "default" {
  dataset_id = google_bigquery_dataset.data_lake2.dataset_id
  table_id   = "my_tf_table"
  project = "psychic-expanse-361619"
  schema = <<EOF
[
  {
    "name": "permalink",
    "type": "STRING",
    "mode": "NULLABLE",
    "description": "The Permalink"
  },
  {
    "name": "state",
    "type": "STRING",
    "mode": "NULLABLE",
    "description": "State where the head office is located"
  }
]
EOF
  deletion_protection = var.deletion_protection
}

variable "deletion_protection" {
  type        = bool
  description = "Whether or not to enable deletion protection for the resource."
  default     = false
}