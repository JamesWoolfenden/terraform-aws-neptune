module "neptune" {
  source               = "../../"
  common_tags          = var.common_tags
  subnet_ids           = ["subnet-05a6a6de2f4989d22", "subnet-03fdfb13a135366a7"]
  kms_key_arn          = ""
  cluster              = local.config
  vpc_id               = "vpc-0c33dc8cd64f408c4"
  allowed_range        = [module.ip.cidr]
  SNSEmailSubscription = "James.Woolfenden@gmail.com"
}

module "ip" {
  source  = "jameswoolfenden/ip/http"
  version = "0.3.2"
}
