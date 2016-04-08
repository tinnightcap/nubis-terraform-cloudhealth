output "assume_role_arn" {
    value = "${aws_iam_roll.cloud_health_roll.arn}"
}

output "assume_role_external_id" {
    value = "${aws_iam_roll.cloud_health_roll.unique_id}"
}
