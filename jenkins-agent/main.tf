resource "kubernetes_deployment_v1" "jks-deploy" {
  metadata {
    name = "jks-agent-deploy"
    namespace = "jks-grf-pth-fake"
  }
}