# Create kubernetes deployment for rabbitmq

resource "kubernetes_deployment" "kube-rabbitmq-deployment" {
  metadata {
    name      = "rabbitmq"
    namespace = kubernetes_namespace.kube-namespace.id
    labels = {
      name = "rabbitmq"
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        name = "rabbitmq"
      }
    }
    template {
      metadata {
        labels = {
          name = "rabbitmq"
        }
      }
      spec {
        container {
          image = "rabbitmq:3.6.8-management"
          name  = "rabbitmq"

      port {
        name = "rabbitmq"
        container_port = 5672
      }

      port {
        name = "management"
        container_port = 15672 
      }

      security_context {
        capabilities {
          drop = ["ALL"]
          add = ["CHOWN", "SETGID", "SETUID"]
        }
        read_only_root_filesystem = false
      }

        }

        container {
            image = "kbudde/rabbitmq-exporter"
            name  = "rabbitmq-exporter"

            port {
            container_port = 9090
            name = "exporter"
             }
        }

      node_selector = {
        "beta.kubernetes.io/os" = "linux"
      }
      }
    }
  }
}




# Create kubernetes  for rabbitmq service

resource "kubernetes_service" "kube-rabbitmq-service" {
  metadata {
    name      = "rabbitmq"
    namespace = kubernetes_namespace.kube-namespace.id
    labels = {
        name = "rabbitmq"
    }
  }
  spec {
    selector = {
      name = "rabbitmq"
    }
    port {
      name = "rabbitmq"
      port        = 5672
      target_port = 5672
    }
    port {
        protocol = "TCP"
        name = "exporter"
        port        = 9090
        target_port = "exporter"
    }
  }
}