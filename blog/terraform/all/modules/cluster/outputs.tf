output "pool_adress" {
  value = google_container_node_pool.primary_node.instance_group_urls
}