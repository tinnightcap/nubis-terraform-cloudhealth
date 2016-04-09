output "assume_role_arn" {
  value = "${aws_iam_role.cloud_health_role.arn}"
}

output "assume_role_external_id" {
  value = "${aws_iam_role.cloud_health_role.unique_id}"
}
