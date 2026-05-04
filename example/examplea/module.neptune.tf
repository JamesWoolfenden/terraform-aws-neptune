module "neptune" {
  source               = "../../"
  common_tags          = var.common_tags
  subnet_ids           = ["subnet-05a6a6de2f4989d22", "subnet-03fdfb13a135366a7"]
  kms_key_arn          = aws_kms_key.neptune.arn
  cluster              = local.config
  vpc_id               = "vpc-0c33dc8cd64f408c4"
  allowed_range        = [module.ip.cidr]
  SNSEmailSubscription = "James.Woolfenden@gmail.com"
}
module "ip" {
  source = "git::https://github.com/JamesWoolfenden/terraform-http-ip.git?ref=2f3cef24e667fb840a3d3481f5a1aaa5a1ac7d28" #v0.3.14
}
resource "aws_kms_key" "neptune" {
  # checkov:skip=CKV2_AWS_64: For example only, key policy managed via IAM
  enable_key_rotation = true
}
