locals {
  s3name = var.bucket_name != null ? var.bucket_name : "${var.teamid}-${var.prjid}"
  # enable_encryption = var.enable_encryption != null ? var.enable_encryption: false
}

locals {
  shared_tags = tomap(
    {
      "Name"    = "${var.teamid}-${var.prjid}",
      "team"    = var.teamid,
      "project" = var.prjid
    }
  )
}
