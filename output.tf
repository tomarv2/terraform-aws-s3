output "bucket_name" {
  description = "The name of the s3 bucket."
  value       = join("", aws_s3_bucket.bucket.*.bucket_domain_name)
}


output "bucket_id" {
  description = "The id of the s3 bucket."
  value       = join("", aws_s3_bucket.bucket.*.id)
}

output "bucket_arn" {
  description = "The ARN of the s3 bucket."
  value       = join("", aws_s3_bucket.bucket.*.arn)
}
