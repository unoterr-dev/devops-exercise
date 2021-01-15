provider "google" {
  credentials = file(var.credentials)
  project     = var.project
  region      = var.region
}
provider "kubernetes" {
}

module "cluster" {
    source = "./modules/cluster"
}