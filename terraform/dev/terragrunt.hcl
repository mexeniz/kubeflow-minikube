locals {
  common_vars = read_terragrunt_config(find_in_parent_folders("common.hcl"))
  environment = "dev"
}

include "root" {
  path = find_in_parent_folders()
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
terraform {
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "${local.common_vars.locals.providers.version}"
    }
  }
}

provider "kubernetes" {
  config_path    = "${local.common_vars.locals.providers.config_path}"
  config_context = "${local.environment}"
}
EOF
}