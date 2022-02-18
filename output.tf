output "bucket_name" {
  description = "The name of the s3 bucket"
  value       = join("", aws_s3_bucket.this.*.bucket)
}

output "bucket_id" {
  description = "The id of the s3 bucket"
  value       = join("", aws_s3_bucket.this.*.id)
}

output "bucket_arn" {
  description = "The ARN of the s3 bucket"
  value       = join("", aws_s3_bucket.this.*.arn)
}

output "bucket_region" {
  value       = join("", aws_s3_bucket.this.*.region)
  description = "The region of the S3 bucket"
}
