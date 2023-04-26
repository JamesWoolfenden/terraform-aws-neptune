resource "aws_sns_topic" "NeptuneAlarmTopic" {
  name              = "NeptuneAlarmTopic"
  display_name      = "${var.stack} alarm topic"
  kms_master_key_id = var.kms_key_arn
  fifo_topic        = false
}
