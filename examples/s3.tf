module "s3" {
  source = "../.."
  email  = "demo@demo.com"
  #----------------------------------------------
  # Note: Do not change teamid and prjid once set.
  teamid = "rumse"
  prjid  = "demo-s3"
}