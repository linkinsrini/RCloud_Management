resource "aws_s3_bucket" "bucket" {
  # (resource arguments)
  bucket        = "rclouds3logdrive"
  force_destroy = false
  tags    = var.common_tags

}

resource "aws_s3_bucket_lifecycle_configuration" "expiration" {
  bucket = aws_s3_bucket.bucket.id
  rule {
    id     = "Expiration after 30 days"
    status = "Enabled"

    expiration {
      days          = 30
      expired_object_delete_marker = "false"
    }

    noncurrent_version_expiration {
      noncurrent_days = 10
    }
  }
}

#S3 bucket to store the vpc flow logs
resource "aws_s3_bucket" "customer" {
  bucket = "rcloud-vpcflowlogs"
  tags = merge(
    var.common_tags,
    tomap({
      "Name" = "rcloud-vpcflowlogs"
    })
  )

}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.customer.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  bucket = aws_s3_bucket.customer.id
  policy = data.aws_iam_policy_document.allow_access_from_another_account.json
}


data "aws_iam_policy_document" "allow_access_from_another_account" {
  statement {
    principals {
      type        = "Service"
      identifiers = ["delivery.logs.amazonaws.com"]
    }

    actions = [
      "s3:*"
    ]

    resources = [
      aws_s3_bucket.customer.arn,
      "${aws_s3_bucket.customer.arn}/*",
    ]
    condition {
      test     = "ForAllValues:StringEquals"
      variable = "aws:SourceAccount"
      values   = var.s3_shared_accounts
    }
  }
}

