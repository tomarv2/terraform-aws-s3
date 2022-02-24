provider "aws" {
  region  = var.aws_region
  profile = var.profile_to_use
}


module "s3" {
  source = "../"

  aws_region = "us-east-2"
  #----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}
