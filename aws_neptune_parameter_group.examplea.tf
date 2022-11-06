resource "aws_neptune_parameter_group" "examplea" {
  family = var.family
  name   = "example"

  parameter {
    name  = "neptune_query_timeout"
    value = var.NeptuneQueryTimeout
  }
}
