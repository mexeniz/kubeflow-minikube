resource "kubernetes_namespace" "webapp" {
  metadata {
    name = "webapp"
  }
}

resource "helm_release" "podinfo_frontend" {
  name       = "frontend"

  repository = "https://stefanprodan.github.io/podinfo"
  chart      = "podinfo"

  namespace = kubernetes_namespace.webapp.metadata[0].name

  set {
    name  = "replicaCount"
    value = "2"
  }

  set {
    name  = "backend"
    value = "http://backend-podinfo:9898/echo"
  }
}

resource "helm_release" "podinfo_backend" {
  name       = "backend"

  repository = "https://stefanprodan.github.io/podinfo"
  chart      = "podinfo"

  namespace = kubernetes_namespace.webapp.metadata[0].name

  set {
    name  = "redis.enabled"
    value = "true"
  }
}