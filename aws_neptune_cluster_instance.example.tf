resource "aws_neptune_cluster_instance" "example" {
  count                     = var.instance["count"]
  cluster_identifier        = aws_neptune_cluster.default.id
  engine                    = var.instance["engine"]
  instance_class            = var.instance["instance_class"]
  apply_immediately         = var.instance["apply_immediately"]
  tags                      = var.common_tags
  neptune_subnet_group_name = aws_neptune_subnet_group.default.name
}
