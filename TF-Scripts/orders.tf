# Create kubernetes deployment for orders 

resource "kubernetes_deployment" "kube-orders-deployment" {
  metadata {
    name      = "orders"
    namespace = kubernetes_namespace.kube-namespace.id
    labels = {
      name = "orders"
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        name = "orders"
      }
    }
    template {
      metadata {
        labels = {
          name = "orders"
        }
      }
      spec {
        container {
          image = "weaveworksdemos/orders:0.4.7"
          name  = "orders"

      env {
        name = "JAVA_OPTS"
        value = "-Xms64m -Xmx128m -XX:+UseG1GC -Djava.security.egd=file:/dev/urandom -Dspring.zipkin.enabled=false"
      }

      resources {
        limits = {
          cpu = "200m"
          memory = "200Mi"
        }
        requests = {
          cpu = "100m"
          memory = "100Mi"
        }
      }

      port {
        container_port = 80
      }

      security_context {
        capabilities {
          drop = ["ALL"]
          add = ["NET_BIND_SERVICE"]
        }
        read_only_root_filesystem = true
        run_as_non_root = true
       run_as_user = 10001
      }

      volume_mount {
        name = "tmp-volume"
        mount_path = "/tmp"
      }
        }
       
     volume {
        name = "tmp-volume"
        empty_dir {
            medium = "Memory"
        }
      }
      node_selector = {
        "beta.kubernetes.io/os" = "linux"
      }
      }
    }
  }
}


# Create kubernetes  for oders service

resource "kubernetes_service" "kube-orders-service" {
  metadata {
    name      = "orders"
    namespace = kubernetes_namespace.kube-namespace.id

    labels = {
        name = "orders"
    }
  }
  spec {
    selector = {
      name = "orders"
    }
    port {
      port        = 80
      target_port = 80
    }
  }
}



# create kubernetes orders-db deployment


resource "kubernetes_deployment" "kube-orders-db-deployment" {
  metadata {
    name      = "orders-db"
    namespace = kubernetes_namespace.kube-namespace.id
    labels = {
      name = "orders-db"
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        name = "orders-db"
      }
    }
    template {
      metadata {
        labels = {
          name = "orders-db"
        }
      }
      spec {
        container {
          image = "mongo"
          name  = "orders-db"

       port {
        name = "mongo"
        container_port = 27017
      }

      security_context {
        capabilities {
          drop = ["ALL"]
          add = ["CHOWN", "SETGID", "SETUID"]
        }
        read_only_root_filesystem = false
            
        }

      volume_mount {
        name = "tmp-volume"
        mount_path = "/tmp"
      }

        }
     volume {
        name = "tmp-volume"
        empty_dir {
            medium = "Memory"
        }
      }
       node_selector = {
        "beta.kubernetes.io/os" = "linux"
      }
      }
    }
  }
}


# service for orders-db

resource "kubernetes_service" "kube-orders-db-service" {
  metadata {
    name      = "orders-db"
    namespace = kubernetes_namespace.kube-namespace.id
    labels = {
        name = "orders-db"
    }
  }
  spec {
    selector = {
      name = "orders-db"
    }
    port {
      port        = 27017
      target_port = 27017
    }
  }
}