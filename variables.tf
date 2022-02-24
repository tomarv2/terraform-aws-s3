variable "teamid" {
  description = "(Required) Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply'"
  type        = string
}

variable "prjid" {
  description = "(Required) Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply'"
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

variable "custom_tags" {
  type        = any
  description = "Extra custom tags"
  default     = null
}
