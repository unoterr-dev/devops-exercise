resource "google_sql_database" "main" {
    name = "main"
    instance = "google_sql_database_instance.main_primary.name"
}

resource "google_sql_database_instance" "main_primary" {
    name = "terraform-base"
    database_version = "POSTGRES_13"
    region = "europe-north1"

//    depends_on = [kubernetes_deployment.app]   //??? CHICKEN OR EGG
    depends_on = [google_container_node_pool.primary_node]

    settings {
        tier = "db-f1-micro"
        availability_type = "REGIONAL"
        disk_size = 10

        ip_configuration {
            authorized_networks {
                name = "GKE"
                value = module.cluster.pool_addres //TAKE FROM POD BLAH BLAH 
            }
        }
    }
}

resource "google_sql_user" "db_user" {
    instance = google_sql_database_instance.main_primary.name
    name = "blog_backend"
    password = "blog_backend" 
}

output "adress" {
  value = google_sql_database_instance.main_primary.ip_address.0.ip_address
}