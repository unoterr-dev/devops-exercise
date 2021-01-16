data "google_client_config" "provider" {}

resource "google_container_cluster" "primary" {
  name     = "terraform-cluster"
  location = "europe-north1"
  node_locations = [
    "europe-north1-a"
    ]
  remove_default_node_pool = true
  initial_node_count       = 1

  network    = var.vpc_name
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
    service_account = "terraformar@terraformar.iam.gserviceaccount.com"
    preemptible  = true
    machine_type = "g1-small"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
//      "https://www.googleapis.com/auth/logging.write",
//      "https://www.googleapis.com/auth/service.management",
//      "https://www.googleapis.com/auth/devstorage.read_only",
    ]
  }
  // NOT VERY GOOD PRACTICCE
  /*
  provisioner "local-exec" {
    command = "gcloud container clusters describe ${google_container_cluster.primary.name} --zone=${google_container_cluster.primary.location}"
  }
  */
}

provider "kubernetes" { 
  load_config_file = false
  host  = "https://${google_container_cluster.primary.endpoint}"
  token = data.google_client_config.provider.access_token
  cluster_ca_certificate = base64decode(
    google_container_cluster.primary.master_auth[0].cluster_ca_certificate,
  ) 
}


