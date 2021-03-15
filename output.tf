output "s3_bucket_name" {
  description = "The name of the s3 bucket."
  value       = aws_s3_bucket.bucket.bucket
}

output "s3_bucket_arn" {
  description = "The ARN of the s3 bucket."
  value       = aws_s3_bucket.bucket.arn
}

output "s3_bucket_id" {
  description = "The id of the s3 bucket."
  value       = aws_s3_bucket.bucket.id
}