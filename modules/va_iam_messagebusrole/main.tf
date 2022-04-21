
resource "aws_iam_role" "vArmourMessageBusRole" {
  name = "vArmourMessageBusRole"
  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "sts:AssumeRole"
            ],
            "Principal": {
                "Service": [
                    "ec2.amazonaws.com"
                ]
            }
        }
    ]
})
  managed_policy_arns = [aws_iam_policy.STSReadOnlyAccess.arn, data.aws_iam_policy.AmazonS3ReadOnlyAccess.arn, data.aws_iam_policy.AmazonEC2ReadOnlyAccess.arn]
  tags        = merge(var.common_tags, { Name = "vArmourMessageBusRole" })
}


resource "aws_iam_policy" "STSReadOnlyAccess" {
  name        = "STSReadOnlyAccess"
  path        = "/"
  description = "Policy created for varmour messagebus via terraform"
  policy = jsonencode({

    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "sts:GetSessionToken",
                "sts:GetFederationToken",
                "sts:GetAccessKeyInfo",
                "sts:GetCallerIdentity",
                "sts:GetServiceBearerToken"
            ],
            "Resource": "*"
        }
    ]
})
  tags        = var.common_tags
}


data "aws_iam_policy" "AmazonS3ReadOnlyAccess" {
  name = "AmazonS3ReadOnlyAccess"
}

data "aws_iam_policy" "AmazonEC2ReadOnlyAccess" {
  name = "AmazonEC2ReadOnlyAccess"
}
