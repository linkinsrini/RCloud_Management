
resource "aws_iam_role" "varmour-mb-s3-vpc-flow-logs" {
  name = "varmour-mb-s3-vpc-flow-logs"
  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::535998799112:user/varmour-mb-s3-vpc-flow-logs"
            },
            "Action": "sts:AssumeRole",
            "Condition": {}
        }
    ]
})
  managed_policy_arns = [data.aws_iam_policy.AmazonEC2ReadOnlyAccess.arn]
  tags        = merge(var.common_tags, { Name = "varmour-mb-s3-vpc-flow-logs" })
}
data "aws_iam_policy" "AmazonEC2ReadOnlyAccess" {
  name = "AmazonEC2ReadOnlyAccess"
}
