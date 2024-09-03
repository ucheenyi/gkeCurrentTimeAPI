# pacs.tf
# Enforce that no public IP addresses are used in firewall rules
resource "google_compute_firewall" "default" {
  name    = "default-firewall"
  network = google_compute_network.vpc_network.id

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["10.0.0.0/24"] # Restrict access to the internal network
}
