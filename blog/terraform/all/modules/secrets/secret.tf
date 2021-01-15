data "google_secret_manager_secret_version" "user" {
  secret  = "user"
  version = "1"
}
data "google_secret_manager_secret_version" "pass" {
  secret  = "pass"
  version = "1"
}