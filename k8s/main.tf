# k8s/main.tf
resource "kubernetes_namespace" "api_namespace" {
  metadata {
    name = "api"
  }
}

resource "kubernetes_deployment" "api_deployment" {
  metadata {
    name      = "api-deployment"
    namespace = kubernetes_namespace.api_namespace.metadata[0].name
  }
  spec {
    replicas = 3
    selector {
      match_labels = {
        app = "api"
      }
    }
    template {
      metadata {
        labels = {
          app = "api"
        }
      }
      spec {
        container {
          name  = "api"
          image = "gcr.io/${var.project_id}/my-api:latest"
          port {
            container_port = 8080
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "api_service" {
  metadata {
    name      = "api-service"
    namespace = kubernetes_namespace.api_namespace.metadata[0].name
  }
  spec {
    selector = {
      app = "api"
    }
    port {
      port        = 80
      target_port  = 8080
    }
    type = "LoadBalancer"
  }
}

resource "kubernetes_ingress" "api_ingress" {
  metadata {
    name      = "api-ingress"
    namespace = kubernetes_namespace.api_namespace.metadata[0].name
  }
  spec {
    rule {
      http {
        path {
          path = "/*"
          backend {
            service_name = kubernetes_service.api_service.metadata[0].name
            service_port = 80
          }
        }
      }
    }
  }
}
