#------------------------
#       Ingress
#------------------------
resource "kubernetes_ingress_v1" "jks-ingress" {
  metadata {
    name      = "jks-ingress"
    namespace = "jks-grf-pth-fake"
    annotations = {
      "kubernetes.io/ingress.class"                 = "nginx",
      "cert-manager.io/cluster-issuer"              = "syndeno-issuer"
      "kubernetes.io/ingress.allow-http"            = "false"
      "nginx.ingress.kubernetes.io/proxy-body-size" = "0"
    }
  }
  spec {
    rule {
      host = "jksFake.plt.aw.syndeno.net"
      http {
        path {
          backend {
            service {
              name = "jks-service"
              port {
                number = 8080
              }
            }
          }
          path = "/"
        }
      }
    }
    tls {
      hosts       = ["jksFake.plt.aw.syndeno.net"]
      secret_name = "jksFake.plt.aw.syndeno.net"
    }
  }
}

#----------------------------
#           Service
#----------------------------

resource "kubernetes_service_v1" "jks-service" {
  metadata {
    name      = "jks-service"
    namespace = "jks-grf-pth"
  }
  spec {
    selector = {
      app = "jks"
    }
    session_affinity = "ClientIP"
    port {
      name = "httpport"
      port        = 8080
      target_port = 8080
      protocol    = "TCP"
    }
    port {
      name = "jnlpport"
      port = 50000
      target_port = 50000
    }
    type = "NodePort"
  }
}

#-----------------------------
#       Deployment
#-----------------------------

resource "kubernetes_deployment_v1" "jks-deploy" {
  metadata {
    name      = "jks-deploy"
    namespace = "jks-grf-pth-fake"
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "jks"
      }
    }
    template {
      metadata {
        labels = {
          app = "jks"
        }
      }
      spec {
        container {
          image = "jenkins/jenkins:latest"
          name  = "jenkins"
          port {
            name = "httpport"
            container_port = 8080
          }
          port {
            name = "jnlpport"
            container_port = 50000
          }
          volume_mount {
            name       = "jenkins-home"
            mount_path = "/var/jenkins_home"
          }
        }
        volume {
          name = "jenkins-home"
          empty_dir {}
        }
      }
    }
  }
}