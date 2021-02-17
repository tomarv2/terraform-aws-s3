module "s3" {
  source =  "../.."

  teamid                        = var.teamid
  prjid                         = var.prjid
  email                         = var.email
  profile_to_use                = var.profile_to_use

  create_bucket                 = var.create_bucket
  bucket_name                   = var.bucket_name
  aws_region                    = var.aws_region
}