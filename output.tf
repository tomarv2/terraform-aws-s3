output "s3_bucket_name" {
  description = "The name of the s3 bucket."
  value       = join("", aws_s3_bucket.bucket.*.bucket)
}


output "s3_bucket_id" {
  description = "The id of the s3 bucket."
  value       = join("", aws_s3_bucket.bucket.*.id)
}

output "s3_bucket_arn" {
  description = "The ARN of the s3 bucket."
  value       = join("", aws_s3_bucket.bucket.*.arn)
}
