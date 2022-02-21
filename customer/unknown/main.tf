# AWS Provider
provider "aws" {
  region  = "us-west-1"
  profile = "rcloud_management"
}

module "subaccounts" {
  source      = "../../modules/subaccounts"
  subaccount  = var.subaccount
  common_tags = local.common_tags
}

module "s3buckets" {
  source             = "../../modules/s3buckets"
  common_tags        = local.common_tags
  s3_shared_accounts = module.subaccounts.subaccount_ids
}