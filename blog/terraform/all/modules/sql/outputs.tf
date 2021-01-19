output "host_addres" {
  value = google_sql_database_instance.main_primary.public_ip_address
}
output "base_name" {
  value = google_sql_database_instance.main_primary.name
}