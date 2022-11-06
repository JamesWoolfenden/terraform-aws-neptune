resource "aws_cloudwatch_metric_alarm" "NeptunePrimaryCpuAlarm" {
  alarm_name                = "NeptunePrimaryCpuAlarm"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = 2
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/Neptune"
  period                    = "300"
  statistic                 = "Average"
  threshold                 = var.HighCpuAlarmThreshold
  actions_enabled           = false
  insufficient_data_actions = []
  ok_actions                = []
  unit                      = "Percent"
  dimensions = {
    DBClusterIdentifier = aws_neptune_cluster.default.cluster_identifier
  }
  alarm_description = "${var.Env}-${var.AppName} primary DB CPU over ${var.HighCpuAlarmThreshold}%"
  alarm_actions     = []
  tags              = var.common_tags
}
