output "pool_addres" {
  value = google_container_node_pool.primary_node.instance_group_urls
}

output "pool_zone" {
  value = google_container_node_pool.primary_node.location
}