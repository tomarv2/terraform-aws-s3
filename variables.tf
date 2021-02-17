variable "email" {
  description = "email address to be used for tagging (suggestion: use group email address)"
}

variable "teamid" {
  description = "(Required) Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply'"
}

variable "prjid" {
  description = "(Required) Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply'"
}

variable "profile_to_use" {
  description = "Getting values from ~/.aws/credentials"
}

variable "bucket_name" {
  description = "s3 bucket name."
}

variable "create_bucket" {
  description = "Do you want to deploy bucket."
  default = false
}

variable "enable_versioning" {
  default = false
}

variable "enable_encryption" {
  default = false
}

variable "sse_algorithm" {
  default = "AES256"
}

variable "server_side_encryption_configuration" {
  description = "Map containing server-side encryption configuration."
  type        = any
  default     = {}
}

variable "aws_region" {
  description = "aws region to create resources"
  default     = "us-west-2"
}