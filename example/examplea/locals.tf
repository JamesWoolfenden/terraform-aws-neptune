locals {
  yaml_config_path = "config.yml"
  config           = yamldecode(file(local.yaml_config_path))
}
