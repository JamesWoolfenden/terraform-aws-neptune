resource "aws_sns_topic_subscription" "NeptuneAlarmSubscription" {
  topic_arn            = aws_sns_topic.NeptuneAlarmTopic.arn
  protocol             = "email"
  endpoint             = var.SNSEmailSubscription
  raw_message_delivery = false
}
