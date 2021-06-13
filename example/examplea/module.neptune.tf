module "neptune" {
  source        = "../../"
  common_tags   = var.common_tags
  subnet_ids    = [""]
  kms_key_arn   = ""
  cluster       = local.config
  vpc_id        = element(tolist(data.aws_vpcs.main.ids), 0)
  allowed_range = [module.ip.cidr]
}

module "ip" {
  source  = "jameswoolfenden/ip/http"
  version = "0.3.2"
}
