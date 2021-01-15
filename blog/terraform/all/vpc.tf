resource "google_compute_network" "vpc_network" {
  name = "terraform-vpc"
  routing_mode = "GLOBAL"
  auto_create_subnetworks = "true"
}
