resource "google_compute_network" "net" {
  name    = var.network_name
  project = var.project_id
}

resource "google_compute_subnetwork" "subnet" {
  name          = var.subnet_name
  project       = google_compute_network.net.project
  network       = google_compute_network.net.id
  ip_cidr_range = "192.168.1.0/24"
  region        = var.region
}

resource "google_compute_router" "router" {
  project = google_compute_network.net.project
  name    = "nat-router"
  network = var.network_name
  region  = var.region
}

resource "google_compute_router_nat" "nat" {
  name                               = "my-router-nat"
  project                            = google_compute_router.router.project
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}