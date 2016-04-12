provider "aws" {
  profile = "${var.aws_profile}"
  region  = "${var.aws_region}"
}

resource "template_file" "cloud_health_role" {
  template = "${file("${path.module}/cloud_health_role.json.tmpl")}"

  vars {
    cloud_health_external_account_id = "${var.cloud_health_external_account_id}"
    cloud_health_external_id         = "${var.cloud_health_external_id}"
  }
}

resource "aws_iam_role" "cloud_health_role" {
  name               = "cloud_health_role"
  path               = "/"
  assume_role_policy = "${template_file.cloud_health_role.rendered}"
}

resource "aws_iam_policy" "policy" {
  name        = "cloud_health_policy"
  path        = "/"
  description = "Policy for Cloud Helath access"
  policy      = "${file("${path.module}/cloud_health_policy.json")}"
}
