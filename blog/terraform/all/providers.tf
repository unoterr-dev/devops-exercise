provider "google" {
  credentials = file(var.credentials)
  project     = var.project
  region      = var.region
}
provider "kubernetes" {
}

module "vpc" {
    source = "./modules/vpc"
}

module "cluster" {
    source = "./modules/cluster"
    vpc_name = module.vpc.vpc_name //useless information for dependency arragment
}

module "sql" {
    source = "./modules/sql"
//    pool_addres = module.cluster.pool_addres
    pool_zone = module.cluster.pool_zone //useless information for dependency arragment
}

module "deploy" {
    source = "./modules/deploy"
    host_addres = module.sql.host_addres
}