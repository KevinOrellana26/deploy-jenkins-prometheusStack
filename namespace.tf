resource "kubernetes_namespace" "tst-ns-terraform" {
  metadata {
    name = "jks-grf-pth-fake"
  }
}