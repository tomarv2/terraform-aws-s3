terraform {
  #required_version = ">= 1.0.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.1.0"
    }
  }
}

provider "aws" {
  region  = "us-west-2"
  #profile = "default"
}
