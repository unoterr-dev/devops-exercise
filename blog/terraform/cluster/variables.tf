variable "project" {
  default = "crafty-clover-301509"
}
variable "region" {
  default = "europe-north1"
}

variable "zone" {
  default = "europe-north1-a"
}

variable "cluster" {
  default = "terraform-test"
}

variable "credentials" {
  default = "cred.json"
}

variable "kubernetes_min_ver" {
  default = "latest"
}

variable "kubernetes_max_ver" {
  default = "latest"
}

variable "machine_type" {
  default = "g1-small"
}

variable "app_name" {
  default = "terraform"
}