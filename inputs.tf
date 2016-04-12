variable "aws_region" {
  description = "AWS region to deploy to"
}

variable "aws_profile" {
  description = "Name of the AWS profile to grab credentials from"
}

variable "cloud_health_external_account_id" {
  description = "External account ID where Cloud Health IAM user is connecting from"
  default     = "454464851268"
}

variable "cloud_health_external_id" {
  description = "External ID to be used with Cloud Health IAM Role assumption"
  default     = "938a62c1-808a-4b14-81e1-1cabf19b239d"
}
