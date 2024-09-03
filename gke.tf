# gke.tf
resource "google_container_cluster" "primary" {
  name     = "my-cluster"
  location = var.region

  network    = google_compute_network.vpc_network.id
  subnetwork = google_compute_subnetwork.subnetwork.id

  node_config {
    machine_type = "e2-medium"
  }

  initial_node_count = 2
}
