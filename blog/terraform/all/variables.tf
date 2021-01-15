variable "project" {
  default = "crafty-clover-301509"
}
variable "region" {
  default = "europe-north1"
}

variable "zone" {
  default = "europe-north1-a"
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

variable "cluster" {
  default = "terraform-cluster"
}
variable "app" {
  type        = string
  description = "Name of application"
  default     = "app"
}

variable "docker-image" {
  type        = string
  description = "This is my image"
  default     = "eu.gcr.io/crafty-clover-301509/unoterr1/blog_comp:latest"
}