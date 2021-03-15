# reference: https://github.com/terraform-aws-modules/terraform-aws-s3-bucket

locals {
  s3name = var.bucket_name != null ? var.bucket_name : "${var.teamid}-${var.prjid}"
  //  enable_encryption = var.enable_encryption != null ? var.enable_encryption: false
}

