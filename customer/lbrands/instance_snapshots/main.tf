resource "aws_iam_role" "dlm_lifecycle_role" {
  name = "dlm-lifecycle-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "dlm.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "dlm_lifecycle" {
  name = "dlm-lifecycle-policy"
  role = aws_iam_role.dlm_lifecycle_role.id

  policy = <<EOF
{
   "Version": "2012-10-17",
   "Statement": [
      {
         "Effect": "Allow",
         "Action": [
            "ec2:CreateSnapshot",
            "ec2:CreateSnapshots",
            "ec2:DeleteSnapshot",
            "ec2:DescribeInstances",
            "ec2:DescribeVolumes",
            "ec2:DescribeSnapshots"
         ],
         "Resource": "*"
      },
      {
         "Effect": "Allow",
         "Action": [
            "ec2:CreateTags"
         ],
         "Resource": "arn:aws:ec2:*::snapshot/*"
      }
   ]
}
EOF
}


resource "aws_dlm_lifecycle_policy" "snapshotpolicy" {
  description        = "${var.customer_name}-${var.environment_type}-DLM-Policy"
  execution_role_arn = aws_iam_role.dlm_lifecycle_role.arn
  state              = "ENABLED"

  policy_details {
    resource_types = ["INSTANCE"]
    schedule {
      name = "${var.customer_name}-${var.environment_type}-schedule"
      create_rule {
        interval      = var.snapshot_interval
        interval_unit = var.snapshot_interval_unit
        times         = var.snapshot_time
      }
      retain_rule {
        count = var.snapshot_retention
      }
      tags_to_add = {
        SnapshotCreator = "DLM"
      }
      copy_tags = true
    }
    target_tags = var.snapshot_tags
  }
  tags = merge(var.common_tags, { Name = "${var.customer_name}-${var.environment_type}-DLM-Policy" })
}