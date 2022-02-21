terraform {
  backend "s3" {
    profile = "rcloud_management"
    # Replace this with your bucket name!
    bucket = "va-relcloud-mgmt-tfstate"
    key    = "states/instances/subaccounts"
    region = "us-west-1"
    # Replace this with your DynamoDB table name!
    dynamodb_table = "va-relcloud-mgmt-tfstate"
    encrypt        = true
  }
}