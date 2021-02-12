module "neptune" {
  source      = "../../"
  common_tags = var.common_tags
  subnet_ids  = [""]
  cluster     = local.config
}
