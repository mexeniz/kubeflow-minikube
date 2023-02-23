locals {
  providers = {
    kubernetes = {
        version = "2.11.0"
        config_path = "~/.kube/config"
    }
    helm = {
        version = "2.9.0"
    }
  }
}