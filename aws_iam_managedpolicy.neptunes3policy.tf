resource "aws_iam_policy" "NeptuneS3Policy" {
  description = "Neptune default policy for S3 access for data load"
  name        = "${var.Env}-${var.AppName}-neptune-s3-policy-${var.Region}"
  policy      = jsonencode({ "Statement" : [{ "Action" : ["s3:Get*", "s3:List*"], "Effect" : "Allow", "Resource" : ["arn:aws:s3:::*"], "Sid" : "AllowNeptuneAccessToS3" }], "Version" : "2012-10-17" })
}
