output "host_adress" {
  value = google_sql_database_instance.main_primary.ip_address.0.ip_address
}