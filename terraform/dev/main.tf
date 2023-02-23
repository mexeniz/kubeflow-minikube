resource "kubernetes_namespace" "webapp" {
  metadata {
    name = "webapp"
  }
}