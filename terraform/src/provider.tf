terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.11.0"
    }

    helm = {
      source = "hashicorp/helm"
      version = "2.9.0"
    }
  }
}

provider "kubernetes" {
  config_path    = var.k8s_config_path
  config_context = var.environment
}

provider "helm" {
  kubernetes {
    config_path    = var.k8s_config_path
    config_context = var.environment
  }
}