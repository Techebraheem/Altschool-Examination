# Create kubernetes deployment for frontend 

resource "kubernetes_deployment" "kube-front-end-deployment" {
  metadata {
    name      = "front-end"
    namespace = kubernetes_namespace.kube-namespace.id
    labels = {
      name = "front-end"
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        name = "front-end"
      }
    }
    template {
      metadata {
        labels = {
          name = "front-end"
        }
      }
      spec {
        container {
          image = "weaveworksdemos/front-end:0.3.12"
          name  = "front-end"
        
        env {
        name = "SESSION_REDIS"
        value = "true"
      }

      resources {
        limits = {
          cpu = "100m"
          memory = "200Mi"
        }
        requests = {
          cpu = "50m"
          memory = "100Mi"
        }
      }

      port {
        container_port = 8079
      }

      security_context {
        capabilities {
          drop = ["ALL"]
        }
        read_only_root_filesystem = true
        run_as_non_root = true
        run_as_user = 10001
        
      }

      liveness_probe {
        http_get {
          path = "/"
          port = 8079
        }
        initial_delay_seconds = 300
        period_seconds = 3
      }

      readiness_probe {
        http_get {
          path = "/"
          port = 8079
        }
        initial_delay_seconds = 30
        period_seconds = 3
      }
        }
       
       node_selector = {
        "beta.kubernetes.io/os" = "linux"
      }
    }
  }
}

}


# Create kubernetes manifest for frontend service

resource "kubernetes_service" "kube-front-end-service" {
  metadata {
    name      = "front-end"
    namespace = kubernetes_namespace.kube-namespace.id

    labels = {
        name = "front-end"
    }
  }
  spec {
    selector = {
      name = "front-end"
    }
    port {
      port        = 80
      target_port = 8079
    }
    type = "LoadBalancer"
  }
}