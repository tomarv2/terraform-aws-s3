# reference: https://github.com/terraform-aws-modules/terraform-aws-s3-bucket

locals{
  s3name = var.bucket_name != null ? var.bucket_name: "${var.teamid}-${var.prjid}"
//  enable_encryption = var.enable_encryption != null ? var.enable_encryption: false
}

resource "aws_s3_bucket" "bucket" {
//  count                                    = var.create_bucket ? 1 : 0

  bucket                                   = local.s3name
  tags                                     = merge(local.shared_tags)
  
  versioning {
    enabled                                = var.enable_versioning
  }

  force_destroy = true

//  server_side_encryption_configuration {
//    rule {
//      apply_server_side_encryption_by_default {
//        sse_algorithm                      = var.sse_algorithm
//      }
//    }
//  }
//    # Max 1 block - server_side_encryption_configuration
//  dynamic "server_side_encryption_configuration" {
//    for_each = length(keys(var.server_side_encryption_configuration)) == 0 ? [] : [var.server_side_encryption_configuration]
//
//    content {
//
//      dynamic "rule" {
//        for_each = length(keys(lookup(server_side_encryption_configuration.value, "rule", {}))) == 0 ? [] : [lookup(server_side_encryption_configuration.value, "rule", {})]
//
//        content {
//
//          dynamic "apply_server_side_encryption_by_default" {
//            for_each = length(keys(lookup(rule.value, "apply_server_side_encryption_by_default", {}))) == 0 ? [] : [
//            lookup(rule.value, "apply_server_side_encryption_by_default", {})]
//
//            content {
//              sse_algorithm     = var.sse_algorithm
////              kms_master_key_id = lookup(apply_server_side_encryption_by_default.value, "kms_master_key_id", null)
//            }
//          }
//        }
//      }
//    }
//  }

}

resource "aws_s3_bucket_public_access_block" "root_storage_bucket" {
  bucket             = aws_s3_bucket.bucket.id
  ignore_public_acls = true
  depends_on         = [aws_s3_bucket.bucket]
  block_public_policy = true
}


