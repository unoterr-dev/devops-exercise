data "google_service_account_access_token" "my_kubernetes_sa" {
  target_service_account = "terraformar@terraformar.iam.gserviceaccount.com"
  scopes                 = ["userinfo-email", "cloud-platform"]
  lifetime               = "3600s"
}

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

resource "google_container_node_pool" "primary_node" {
  name       = "my-node-pool"
  location   = "europe-north1"
  cluster    = google_container_cluster.primary.name
  node_count = 1

  node_config {
    service_account = var.service_acc
    preemptible  = true
    machine_type = "g1-small"
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
  /*
  provisioner "local-exec" {
    command = "gcloud container clusters describe ${google_container_cluster.primary.name} --zone=${google_container_cluster.primary.location}"
    interpreter = ["/bin/zsh", "-c"]
  } */ //0_0
}

provider "kubernetes" { 
  load_config_file = false
  host  = "https://${google_container_cluster.primary.endpoint}"
  token = data.google_service_account_access_token.my_kubernetes_sa.access_token
  cluster_ca_certificate = base64decode(
    google_container_cluster.primary.master_auth[0].cluster_ca_certificate,
  ) 
}


