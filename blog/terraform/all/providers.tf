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

module "sql" {
    source = "./modules/sql"
    pool_addres = module.cluster.pool_addres
}

module "deploy" {
    source = "./modules/deploy"
    host_addres = module.sql.host_addres
}