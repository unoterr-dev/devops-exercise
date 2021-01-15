resource "google_sql_database" "main" {
    name = "main"
    instance = "google_sql_database_instance.main_primary.name"
}

resource "google_sql_database_instance" "main_primary" {
    name = "terraform-base"
    database_version = "POSTGRES_13"
    region = "europe-north1"

//    depends_on = [kubernetes_deployment.app]   //??? CHICKEN OR EGG
//    depends_on = [google_container_node_pool.primary_node]

    settings {
        tier = "db-f1-micro"
        availability_type = "REGIONAL"
        disk_size = 10

        ip_configuration {
            authorized_networks {
                name = "All"
                //value = var.pool_addres 
                value = "0.0.0.0/0" //BAD BAD VERY BAD
            }
        }
    }
}

resource "google_sql_user" "db_user" {
    instance = resource.google_sql_database_instance.main_primary.name
    name = "blog_backend"
    password = "blog_backend" 
}
