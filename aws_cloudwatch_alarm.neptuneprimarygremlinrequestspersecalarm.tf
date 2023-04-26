resource "aws_cloudwatch_metric_alarm" "NeptunePrimaryGremlinRequestsPerSecAlarm" {
  alarm_name                = "NeptunePrimaryGremlinRequestsPerSecAlarm"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = 2
  metric_name               = "GremlinRequestsPerSec"
  namespace                 = "AWS/Neptune"
  period                    = "300"
  statistic                 = "Average"
  threshold                 = var.GremlinRequestsPerSecThreshold
  actions_enabled           = true
  insufficient_data_actions = []
  ok_actions                = []
  dimensions = {
    DBClusterIdentifier = "gremlin-cluster"
  }
  alarm_description = "${var.Env}-${var.AppName} primary DB Gremlin Requests Per Second"
  alarm_actions     = []
}
