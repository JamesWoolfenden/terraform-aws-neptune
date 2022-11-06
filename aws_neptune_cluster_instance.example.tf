resource "aws_neptune_cluster_instance" "example" {
  auto_minor_version_upgrade   = true
  apply_immediately            = var.instance["apply_immediately"]
  neptune_subnet_group_name    = aws_neptune_subnet_group.default.name
  neptune_parameter_group_name = aws_neptune_parameter_group.examplea.name
  preferred_maintenance_window = var.NeptuneDBInstancePreferredMaintenanceWindow
  publicly_accessible          = false
  cluster_identifier           = aws_neptune_cluster.default.cluster_identifier
  engine                       = var.instance["engine"]
  identifier                   = var.identifier
  instance_class               = var.instance["instance_class"]
  port                         = var.port
  tags                         = var.common_tags
}
