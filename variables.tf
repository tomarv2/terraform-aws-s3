variable "teamid" {
  description = "(Required) Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply'"
  type        = string
}

variable "prjid" {
  description = "(Required) Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply'"
  type        = string
}

variable "profile_to_use" {
  description = "Getting values from ~/.aws/credentials"
  default     = "default"
  type        = string
}

variable "bucket_name" {
  description = "s3 bucket name."
  default     = null
  type        = string
}

variable "deploy_bucket" {
  description = "feature flag, true or false"
  default     = true
  type        = bool
}

variable "enable_versioning" {
  description = "enable versioning on the bucket"
  default     = true
  type        = bool
}

variable "enable_encryption" {
  description = "enable encryption on the bucket"
  default     = false
  type        = bool
}

variable "sse_algorithm" {
  description = "encryption algorithm"
  default     = "AES256"
  type        = string
}

variable "server_side_encryption_configuration" {
  description = "Map containing server-side encryption configuration."
  type        = any
  default     = {}
}

variable "aws_region" {
  description = "aws region to create resources"
  default     = "us-west-2"
  type        = string
}

variable "custom_tags" {
  type        = any
  description = "Extra custom tags"
  default     = null
}