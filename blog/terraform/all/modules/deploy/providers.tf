data "google_client_config" "provider" {
}

data "google_container_cluster" "primary" {
  name     = "terraform-cluster"
  location = "europe-north1"
}

provider "kubernetes" {
  load_config_file = false
  host  = "https://${data.google_container_cluster.primary.endpoint}"
  token = data.google_client_config.provider.access_token
  cluster_ca_certificate = base64decode(
    data.google_container_cluster.primary.master_auth[0].cluster_ca_certificate,
  )
}