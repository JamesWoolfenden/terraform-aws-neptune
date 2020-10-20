module "neptune" {
  source      = "../../"
  common_tags = var.common_tags
  subnet_ids  = [element(tolist(data.aws_subnet_ids.mysubnets.ids), 0)]
  cluster     = local.config
}
