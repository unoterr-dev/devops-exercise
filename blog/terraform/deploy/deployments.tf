resource "google_container_registry" "registry" {
  project  = "crafty-clover-301509"
  location = "EU"
}

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
          image = "eu.gcr.io/crafty-clover-301509/unoterr1/blog_comp:latest"
          name  = var.app
          port {
            name = "port-3000"
            container_port = 3000
          }
          env {
            name  = "DATABASE_HOST"
            value = "35.228.200.78"
          }
          env {
            name  = "DATABASE_NAME"
            value = "blog-backend"
          }
          env {
            name  = "DATABASE_PASSWORD"
            value = "blog_backend"
          }
          env {
            name  = "DATABASE_USERNAME"
            value = "blog_backend"
          }

        }
      }
    }
  }
}
