variable "aws_region" {
  description = "AWS region to deploy to"
}

variable "aws_profile" {
  description = "Name of the AWS profile to grab credentials from"
}

variable "cloud_health_external_account_id" {
  description = "External account ID where Cloud Health IAM user is connecting from"
  default = "454464851268"
}

variable "cloud_health_external_id" {
  description = "External ID to be used with Cloud Health IAM Role assumption"
  default = "bH4vrIXUcQ2i2Z6soruijiIN"
}

variable "billing_bucket_name" {
  description = "Name of the billing bucket where billing data will be sent"
  default = "mozilla-programmatic-billing.s3-website-us-west-1.amazonaws.com"
}
