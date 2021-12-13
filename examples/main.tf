provider "aws" {
  region = "us-west-2"
}
module "s3" {
  source = "../"

  #----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = var.teamid
  prjid  = var.prjid
}
