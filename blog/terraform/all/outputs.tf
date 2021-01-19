output "user" {
  value = module.secrets.secret_user
}

output "pass" {
  value = module.secrets.secret_pass
}

output "host" {
  value = module.sql.host_addres
}

output "name" {
  value = module.sql.base_name
}
