resource "aws_neptune_cluster_instance" "example" {
  count                        = var.instance["count"]
  apply_immediately            = var.instance["apply_immediately"]
  availability_zone            = ""
  cluster_identifier           = aws_neptune_cluster.default.id
  engine_version               = ""
  engine                       = var.instance["engine"]
  identifier                   = ""
  instance_class               = var.instance["instance_class"]
  neptune_subnet_group_name    = aws_neptune_subnet_group.default.name
  neptune_parameter_group_name = aws_neptune_parameter_group.examplea.name
  port                         = 8182
  tags                         = var.common_tags
  //test is not true
  preferred_backup_window      = ""
  preferred_maintenance_window = ""
  publicly_accessible          = false
}
