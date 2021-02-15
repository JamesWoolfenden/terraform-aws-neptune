resource "aws_neptune_cluster" "default" {
  cluster_identifier                  = var.cluster["cluster_identifier"]
  engine                              = var.cluster["engine"]
  backup_retention_period             = var.cluster["backup_retention_period"]
  preferred_backup_window             = var.cluster["preferred_backup_window"]
  skip_final_snapshot                 = var.cluster["skip_final_snapshot"]
  iam_database_authentication_enabled = var.cluster["iam_database_authentication_enabled"]
  apply_immediately                   = var.cluster["apply_immediately"]
  storage_encrypted                   = true
  neptune_subnet_group_name           = aws_neptune_subnet_group.default.name
  enable_cloudwatch_logs_exports      = ["audit"]
  tags                                = var.common_tags
}
