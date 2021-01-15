output "secret_user" {
  value = data.google_secret_manager_secret_version.user.secret_data
}
output "secret_pass" {
  value = data.google_secret_manager_secret_version.pass.secret_data
}