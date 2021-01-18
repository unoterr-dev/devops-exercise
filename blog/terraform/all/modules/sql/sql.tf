resource "google_sql_database" "main" {
    name = "main"
    instance = google_sql_database_instance.main_primary.name
}

resource "random_id" "db_name_suffix" {
  byte_length = 4
}

resource "google_sql_database_instance" "main_primary" {
    name = "terraform-base-${random_id.db_name_suffix.hex}"
    database_version = "POSTGRES_13"
    region = var.pool_zone // "europe-north1"


    deletion_protection = false

//    depends_on = [kubernetes_deployment.app]   //??? CHICKEN OR EGG
//    depends_on = [google_container_node_pool.primary_node]

    settings {
        tier = "db-f1-micro"
        availability_type = "REGIONAL"
        disk_size = 10

        ip_configuration {
            /*
            authorized_networks {
                name = "All"
                //value = var.pool_addres 
                value = "0.0.0.0/0" //BAD BAD VERY BAD
            } */
            ipv4_enabled    = false
            private_network = var.vpc_id
        }
    }
}
resource "google_sql_user" "db_user" {
    instance = google_sql_database_instance.main_primary.name
    name = var.user
    password = var.pass 
}
