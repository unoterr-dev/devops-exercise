output "user" {
  value = module.secrets.secret_user
  sensitive = true
}

output "pass" {
  value = module.secrets.secret_pass
  sensitive = true
}

output "host" {
  value = module.sql.host_addres
}

output "name" {
  value = module.sql.base_name
}
