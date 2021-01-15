variable "host_addres" {
  type = string
}
variable "app" {
  type        = string
  description = "Name of application"
  default     = "app"
}

variable "user" {
  type = string
}
variable "pass" {
  type = string
}
variable "image" {
  type = string
}

variable "full_image" {
  default = format("eu.gcr.io/crafty-clover-301509/unoterr1/blog_comp:%s", var.image)
}

/*
variable "docker-image" {
  type        = string
  description = "This is my image"
  default     = "eu.gcr.io/crafty-clover-301509/unoterr1/blog_comp:latest"
}
*/