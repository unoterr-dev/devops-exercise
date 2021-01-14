resource "kubernetes_deployment" "app" {
  metadata {
    name = var.app
    labels = {
      app = var.app
    }
  }
  spec {
    selector {
      match_labels = {
        app = var.app
      }
    }
    template {
      metadata {
        labels = {
          app = var.app
        }
      }
      spec {
        container {
          image = var.docker-image
          name  = var.app
          port {
            name           = "port-3000"
            container_port = 3000
          }
          env {
            DATABASE_HOST = "35.228.200.78"
            DATABASE_NAME = "blog-backend"
            DATABASE_PASSWORD = "blog_backend"
            DATABASE_USERNAME = "blog_backend"
          }
        }
      }
    }
  }
}