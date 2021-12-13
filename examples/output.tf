output "s3_bucket_name" {
  description = "The name of the s3 bucket."
  value       = module.s3.bucket_name
}

output "bucket_name" {
  description = "The name of the s3 bucket."
  value       = module.s3.bucket_name
}

output "bucket_id" {
  description = "The id of the s3 bucket."
  value       = module.s3.bucket_id
}

output "bucket_arn" {
  description = "The ARN of the s3 bucket."
  value       = module.s3.bucket_arn
}

output "bucket_region" {
  description = "Bucket region"
  value       = module.s3.bucket_region
}
