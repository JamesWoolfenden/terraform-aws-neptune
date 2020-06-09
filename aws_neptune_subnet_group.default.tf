resource "aws_neptune_subnet_group" "default" {
  name       = var.subnet_group_name
  subnet_ids = var.subnet_ids

  tags = var.common_tags
}
