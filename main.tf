resource "aws_iam_role" "cloud_health_role" {
    name = "cloud_health_role"
    path = "/"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "sts:AssumeRole",
      "Principal": { "AWS": "arn:aws:iam::${var.cloud_health_external_account_id}:root" },
      "Condition": { "StringEquals": { "sts:ExternalId": { ${var.cloud_health_external_id} } } },
    }
  ]
}
EOF
}
resource "aws_iam_policy" "policy" {
    name = "cloud_health_policy"
    path = "/"
    description = "Policy for Cloud Helath access"
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "aws-portal:ViewBilling",
        "aws-portal:ViewUsage",
        "autoscaling:Describe*",
        "cloudformation:ListStacks",
        "cloudformation:ListStackResources",
        "cloudformation:DescribeStacks",
        "cloudformation:DescribeStackEvents",
        "cloudformation:DescribeStackResources",
        "cloudformation:GetTemplate",
        "cloudfront:Get*",
        "cloudfront:List*",
        "cloudwatch:Describe*",
        "cloudwatch:Get*",
        "cloudwatch:List*",
        "dynamodb:DescribeTable",
        "dynamodb:ListTables",
        "ec2:Describe*",
        "elasticache:Describe*",
        "elasticache:ListTagsForResource",
        "elasticbeanstalk:Check*",
        "elasticbeanstalk:Describe*",
        "elasticbeanstalk:List*",
        "elasticbeanstalk:RequestEnvironmentInfo",
        "elasticbeanstalk:RetrieveEnvironmentInfo",
        "elasticloadbalancing:Describe*",
        "elasticmapreduce:Describe*",
        "elasticmapreduce:List*",
        "iam:List*",
        "iam:Get*",
        "redshift:Describe*",
        "route53:Get*",
        "route53:List*",
        "rds:Describe*",
        "rds:ListTagsForResource",
        "s3:List*",
        "s3:GetBucketTagging",
        "s3:GetBucketLocation",
        "s3:GetBucketLogging",
        "s3:GetBucketVersioning",
        "s3:GetBucketWebsite",
        "sdb:GetAttributes",
        "sdb:List*",
        "sdb:Select*",
        "ses:Get*",
        "ses:List*",
        "sns:Get*",
        "sns:List*",
        "sqs:GetQueueAttributes",
        "sqs:ListQueues",
        "storagegateway:List*",
        "storagegateway:Describe*"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "s3:Get*",
        "s3:List*"
      ],
      "Resource": [
        "arn:aws:s3:::${var.billing_bucket_name}",
        "arn:aws:s3:::${var.billing_bucket_name}/*"
      ]
    },
    {
      "Effect": "Deny",
      "Action": [
        "autoscaling:DescribeLaunchConfigurations",
        "ec2:DescribeInstanceAttribute",
        "cloudformation:DescribeStacks",
        "sdb:Select"
      ],
      "Resource": [
        "*"
      ]
    }
    "Roles": [
      {
        "Ref": "cloud_health_role"
      }
    ]
  ]
}
EOF
}
