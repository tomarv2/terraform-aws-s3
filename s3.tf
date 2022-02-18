resource "aws_s3_bucket" "bucket" {
  count = var.deploy_bucket ? 1 : 0

  bucket = local.s3name
  tags   = merge(local.shared_tags)

  versioning {
    enabled = var.enable_versioning
  }

  force_destroy = true

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_s3_bucket_public_access_block" "root_storage_bucket" {
  count = var.deploy_bucket ? 1 : 0

  bucket                  = join("", aws_s3_bucket.bucket.*.id)
  ignore_public_acls      = true
  depends_on              = [aws_s3_bucket.bucket]
  block_public_acls       = true
  block_public_policy     = true
  restrict_public_buckets = true
}
