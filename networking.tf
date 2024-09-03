# networking.tf
resource "google_compute_network" "vpc_network" {
  name = var.network_name
}

resource "google_compute_subnetwork" "subnetwork" {
  name          = var.subnet_name
  ip_cidr_range = "10.0.0.0/24"
  network       = google_compute_network.vpc_network.id
  region        = var.region
}

resource "google_compute_global_address" "nat_ip" {
  name = var.nat_ip_name
}

resource "google_compute_router" "router" {
  name    = "my-router"
  network = google_compute_network.vpc_network.id
  region  = var.region
}

resource "google_compute_router_nat" "nat" {
  name                   = "my-nat"
  router                 = google_compute_router.router.name
  region                 = var.region
  nat_ip_allocate_option = "MANUAL_ONLY"

  nat_ips = [google_compute_global_address.nat_ip.address]

  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}
