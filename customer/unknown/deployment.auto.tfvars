
# #TAGS - can also add additional tags in tags.tf file
# customer_name    = "rcloud-mgmt"
# environment_type = "prod"
# software_version = "6.2.1"
# created_by       = "terraform_Skrishnasamy"


# Reference code for future accounts
subaccount = {
  "Relationship Cloud Root" = {
    name   = "Relationship Cloud Root"
    email  = "saas-admin@varmour.com"
    region = "us-west-1"
  }
  "dev" = {
    name   = "dev"
    email  = "teamsre@varmour.com"
    region = "us-west-1"
  }
  "ncs-datacom" = {
    name   = "ncs-datacom"
    email  = "ncs-datacom@varmour.com"
    region = "us-east-2"
  }
  "Sandbox" = {
    name   = "Sandbox"
    email  = "sre_sandbox@varmour.com"
    region = "us-west-1"
  }
  "varmour" = {
    name   = "varmour"
    email  = "saas-varmour@varmour.com"
    region = "us-west-1"
  }
  "wipro" = {
    name   = "wipro"
    email  = "saas-wipro@varmour.com"
    region = "us-east-2"
  }
}

#TAGS - can also add additional tags in tags.tf file
customer_name    = "rcloud-mgmt"
environment_type = "prod"
software_version = "6.2.1"
created_by       = "terraform_Skrishnasamy"
