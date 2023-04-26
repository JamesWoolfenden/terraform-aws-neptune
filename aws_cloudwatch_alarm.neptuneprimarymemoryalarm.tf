resource "aws_cloudwatch_metric_alarm" "NeptunePrimaryMemoryAlarm" {
  alarm_name                = "NeptunePrimaryMemoryAlarm"
  comparison_operator       = "LessThanOrEqualToThreshold"
  evaluation_periods        = 2
  metric_name               = "FreeableMemory"
  namespace                 = "AWS/Neptune"
  period                    = "300"
  statistic                 = "Average"
  threshold                 = var.LowMemoryAlarmThreshold
  actions_enabled           = true
  insufficient_data_actions = []
  ok_actions                = []
  unit                      = "Bytes"
  dimensions = {
    DBClusterIdentifier = aws_neptune_cluster.default.cluster_identifier
  }
  alarm_description = "${var.Env}-${var.AppName} primary DB memory under ${var.LowMemoryAlarmThreshold} bytes"
  alarm_actions     = []
}
