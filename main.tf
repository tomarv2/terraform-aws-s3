resource "aws_s3_bucket" "default" {
  count = var.deploy_bucket ? 1 : 0

  bucket = local.s3name
  tags   = var.custom_tags != null ? merge(var.custom_tags, local.shared_tags) : merge(local.shared_tags)

  versioning {
    enabled = var.enable_versioning
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = var.sse_algorithm
      }
    }
  }
}

resource "aws_s3_bucket_policy" "this" {
  count = var.deploy_bucket && local.attach_policy ? 1 : 0

  bucket     = aws_s3_bucket.default[0].id
  policy     = data.aws_iam_policy_document.combined[0].json
  depends_on = [aws_s3_bucket_public_access_block.default]
}

data "aws_iam_policy_document" "combined" {
  count = var.deploy_bucket && local.attach_policy ? 1 : 0

  source_policy_documents = compact([
    var.attach_policy ? var.policy : ""
  ])
}

resource "aws_s3_bucket_public_access_block" "default" {
  count = var.deploy_bucket && local.public_access_block_enabled ? 1 : 0

  bucket = local.s3name

  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets
}
