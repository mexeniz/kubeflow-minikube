locals {
  common_vars = read_terragrunt_config(find_in_parent_folders("common.hcl"))
}

include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../src"
}

inputs = {
  environment      = "prod"
  k8s_config_path  = local.common_vars.locals.providers.kubernetes.config_path
  podinfo_ui_color = "#1976D2"
}
