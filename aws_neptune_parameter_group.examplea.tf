resource "aws_neptune_parameter_group" "examplea" {
  family = "neptune1"
  name   = "example"

  parameter {
    name  = "neptune_query_timeout"
    value = "25"
  }

  parameter {
    name  = "neptune_enable_audit_log"
    value = 1
  }

  tags = var.common_tags
}
