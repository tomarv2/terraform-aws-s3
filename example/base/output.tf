output "s3_bucket_name" {
  description = "The name of the s3 bucket."
  value = module.s3.s3_bucket_name
}

output "s3_bucket_arn" {
  description = "The ARN of the s3 bucket."
  value = module.s3.s3_bucket_arn
}