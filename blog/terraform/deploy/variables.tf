variable "cluster" {
  default = "terraform-cluster"
}
variable "app" {
  type        = string
  description = "Name of application"
  default     = "app-1"
}

variable "zone" {
  default = "europe-north1"
}

variable "docker-image" {
  type        = string
  description = "This is my image"
  default     = "eu.gcr.io/crafty-clover-301509/unoterr1/blog_comp:latest"
}