resource "aws_iam_role" "NeptuneRole" {
  force_detach_policies = false
  inline_policy {}
  managed_policy_arns = [aws_iam_policy.NeptuneCloudWatchPolicy.arn, aws_iam_policy.NeptuneS3Policy.arn]
  name                = "${var.Env}-${var.AppName}-neptune-iam-role-${var.Region}"
  assume_role_policy  = jsonencode({ "Statement" : [{ "Action" : "sts:AssumeRole", "Effect" : "Allow", "Principal" : { "Service" : ["monitoring.rds.amazonaws.com", "rds.amazonaws.com"] } }], "Version" : "2012-10-17" })
}
