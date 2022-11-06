resource "aws_neptune_cluster_parameter_group" "NeptuneDBClusterParameterGroup" {
  family      = var.family
  name        = "${var.Env}-${var.AppName}-neptune-cluster-parameter-group"
  description = "CloudFormation managed Neptune DB Cluster Parameter Group - ${var.Env}-${var.AppName}-cluster-parameter-group"
  parameter {
    name  = "neptune_enable_audit_log"
    value = var.neptune_enable_audit_log
  }
  tags = var.common_tags
}
