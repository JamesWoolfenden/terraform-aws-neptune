resource "aws_iam_policy" "NeptuneCloudWatchPolicy" {
  # checkov:skip=CKV_AWS_290: IAM policy requires broad write access for this module to function
  # checkov:skip=CKV_AWS_355: IAM policy requires wildcard resource for this module to function
  description = "Default policy for CloudWatch logs"
  name        = "${var.Env}-${var.AppName}-neptune-cw-policy-${var.Region}"
  policy      = jsonencode({ "Statement" : [{ "Action" : ["logs:CreateLogGroup", "logs:PutRetentionPolicy"], "Effect" : "Allow", "Resource" : ["arn:aws:logs:*:*:log-group:/aws/neptune/*"], "Sid" : "EnableLogGroups" }, { "Action" : ["logs:CreateLogStream", "logs:PutLogEvents", "logs:DescriptLogStreams", "logs:GetLogEvents"], "Effect" : "Allow", "Resource" : ["arn:aws:logs:*:*:log-group:/aws/neptune/*:log-stream:*"], "Sid" : "EnableLogStreams" }], "Version" : "2012-10-17" })
}
