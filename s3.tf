resource "aws_s3_bucket" "this" {
  count = var.deploy_bucket ? 1 : 0

  bucket = local.s3name
  tags   = var.custom_tags != null ? merge(var.custom_tags, local.shared_tags) : merge(local.shared_tags)

}

resource "aws_s3_bucket_versioning" "this" {
  count = var.deploy_bucket && var.enable_versioning ? 1 : 0

  bucket = aws_s3_bucket.this[0].id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  count  = var.deploy_bucket && var.enable_server_side_encryption ? 1 : 0
  bucket = aws_s3_bucket.this[0].id

  rule {
    apply_server_side_encryption_by_default {
      #kms_master_key_id = aws_kms_key.mykey.arn
      sse_algorithm = var.sse_algorithm
    }
  }
}

resource "aws_s3_bucket_accelerate_configuration" "this" {
  count  = var.deploy_bucket && var.enable_accelerate_configuration ? 1 : 0
  bucket = aws_s3_bucket.this[0].id

  status = "Enabled"
}


resource "aws_s3_bucket_cors_configuration" "this" {
  count  = var.deploy_bucket && var.enable_cors_configuration ? 1 : 0
  bucket = aws_s3_bucket.this[0].id

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT", "POST"]
    allowed_origins = ["https://s3-website-test.hashicorp.com"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }
}

resource "aws_s3_bucket_policy" "this" {
  count = var.deploy_bucket && local.attach_policy ? 1 : 0

  bucket     = aws_s3_bucket.this[0].id
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

provider "aws" {
  region  = "us-west-2"
  profile = "default"
}