resource "google_compute_network" "vpc_network" {
  name = "terraform-vpc"
//  routing_mode = "GLOBAL"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "subnet" {
 name          = "terraform-sub"
 ip_cidr_range = "10.10.0.0/24"
 network       = google_compute_network.vpc_network.name
 region        = "europe-north1"
}

resource "google_compute_firewall" "firewall" {
  name    = "terraform-firewall"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

/*
resource "google_compute_global_address" "private_ip_address" {
  provider = google-beta
  name          = "private-ip-address"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = google_compute_network.vpc_network.id
}

resource "google_service_networking_connection" "private_vpc_connection" {
  provider = google-beta
  network                 = google_compute_network.vpc_network.id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_address.name]
}
*/