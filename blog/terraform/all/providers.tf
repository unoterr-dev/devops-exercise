provider "google" {
    credentials = file(var.credentials)
    project     = var.project
    region      = var.region
}

module "secrets" {
    source = "./modules/secrets"
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
    pool_zone = module.cluster.pool_zone //useless information for dependency arragment
    vpc_id = module.vpc.vpc_id
    user = module.secrets.secret_user
    pass = module.secrets.secret_pass
}

module "deploy" {
    source = "./modules/deploy"
    host_addres = module.sql.host_addres
    user = module.secrets.secret_user
    pass = module.secrets.secret_pass
    image = var.image
}
