# iam.tf
resource "google_project_iam_member" "k8s_cluster_admin" {
  project = var.project_id
  role    = "roles/container.clusterAdmin"
  member  = "serviceAccount:${google_service_account.k8s_service_account.email}"
}

resource "google_service_account" "k8s_service_account" {
  account_id   = "k8s-service-account"
  display_name = "K8s Service Account"
}
