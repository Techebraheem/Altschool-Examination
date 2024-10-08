# Create kubernetes deployment for queue-master 

resource "kubernetes_deployment" "kube-queue-master-deployment" {
  metadata {
    name      = "queue-master"
    namespace = kubernetes_namespace.kube-namespace.id
    labels = {
      name = "queue-master"
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        name = "queue-master"
      }
    }
    template {
      metadata {
        labels = {
          name = "queue-master"
        }
      }
      spec {
        container {
          image = "weaveworksdemos/queue-master:0.3.1"
          name  = "queue-master"

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

      }
       node_selector = {
        "beta.kubernetes.io/os" = "linux"
      }
      }
    }
  }
}




# Create kubernetes  for queue-master service

resource "kubernetes_service" "kube-queue-master-service" {
  metadata {
    name      = "queue-master"
    namespace = kubernetes_namespace.kube-namespace.id
    labels = {
        name = "queue-master"
    }
  }
  spec {
    selector = {
      name = "queue-master"
    }
    port {
      port        = 80
      target_port = 80
    }
  }
}