module "neptune" {
  source      = "../../"
  common_tags = var.common_tags
  subnet_ids  = [element(tolist(data.aws_subnet_ids.private.ids), 0)]
  cluster     = var.cluster
}
