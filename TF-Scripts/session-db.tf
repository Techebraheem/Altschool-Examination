# Create kubernetes deployment for session-db

resource "kubernetes_deployment" "kube-session-db-deployment" {
  metadata {
    name      = "session-db"
    namespace = kubernetes_namespace.kube-namespace.id
    labels = {
      name = "session-db"
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        name = "session-db"
      }
    }
    template {
      metadata {
        labels = {
          name = "session-db"
        }
      }
      spec {
        container {
          image = "redis:alpine"
          name  = "session-db"

      port {
        name = "redis"
        container_port = 6379
      }

      security_context {
        capabilities {
          drop = ["ALL"]
          add = ["CHOWN", "SETGID", "SETUID"]
        }
        read_only_root_filesystem = false
      }
     
      }
        node_selector = {
        "beta.kubernetes.io/os" = "linux"
      }
    }
  }
}
}



# Create kubernetes  for session-db service

resource "kubernetes_service" "kube-session-db-service" {
  metadata {
    name      = "cartsession-dbs"
    namespace = kubernetes_namespace.kube-namespace.id

    labels = {
        name = "session-db"
    }
  }
  spec {
    selector = {
      name = "session-db"
    }
    port {
      port        = 6379
      target_port = 6379
    }
  }
}