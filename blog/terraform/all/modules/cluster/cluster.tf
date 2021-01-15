resource "google_container_cluster" "primary" {
  name     = "terraform-cluster"
  location = "europe-north1"
  node_locations = [
    "europe-north1-a"
    ]
  remove_default_node_pool = true
  initial_node_count       = 1

  network    = "terraform-vpc"
  subnetwork = "terraform-vpc"

  ip_allocation_policy {
    cluster_ipv4_cidr_block  = "/16"
    services_ipv4_cidr_block = "/22"
  }

}
# gcloud container clusters get-credentials terraform-cluster --zone="europe-north1""
resource "google_container_node_pool" "primary_node" {
  name       = "my-node-pool"
  location   = "europe-north1"
  cluster    = google_container_cluster.primary.name
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "g1-small"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/service.management",
    ]
  }
}

