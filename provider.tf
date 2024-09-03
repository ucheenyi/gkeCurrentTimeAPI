# provider.tf
provider "google" {
  credentials = file("C:/credentials-file.json")
  project     = var.project_id
  region      = var.region
}

provider "kubernetes" {
  load_config_file       = false
  host                   = google_container_cluster.primary.endpoint
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(google_container_cluster.primary.master_auth.0.cluster_ca_certificate)
}

variable "project_id" {
  description = "The ID of the Google Cloud project"
}

variable "region" {
  description = "The GCP region"
  default     = "us-central1"
}
