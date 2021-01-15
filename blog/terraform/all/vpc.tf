resource "google_compute_network" "vpc_network" {
  name = "terraform-net"
  auto_create_subnetworks = "true"
}
