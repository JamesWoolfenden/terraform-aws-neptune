data "aws_subnet_ids" "mysubnets" {
  vpc_id = element(tolist(data.aws_vpcs.main.ids), 0)

  filter {
    name   = "tag:Type"
    values = [local.config["sub_tag"]]
  }
}

data "aws_vpcs" "main" {

  filter {
    name   = "tag:Name"
    values = [local.config["vpc_name_tag"]]
  }

}

data "aws_caller_identity" "current" {}
