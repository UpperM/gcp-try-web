
# Create VPC for backend
resource "google_compute_network" "vpc" {
  name = "web-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "private-subnetwork" {
  name          = "web-subnetwork"
  ip_cidr_range = "10.132.1.0/24"
  region        = var.gcp_region
  network       = google_compute_network.vpc.id
}


resource "google_compute_firewall" "firewall_backend" {
  name    = "backend-firewall"
  network = google_compute_network.vpc.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80","22","8080","6081","6082"]
  }
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "firewall_frontend" {
  name    = "frontend-firewall"
  network = google_compute_network.vpc.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80","22","6081"]
  }
  source_ranges = ["0.0.0.0/0"]
}
