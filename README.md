# RCloud_Management

module.subaccounts.aws_organizations_account.subaccount["wipro"] 054475548886
tf import 'module.subaccounts.aws_organizations_account.subaccount["varmour"]' 226442185253
tf import 'module.subaccounts.aws_organizations_account.subaccount["ncs-datacom"]' 504141003854
tf import 'module.subaccounts.aws_organizations_account.subaccount["Sandbox"]' 974084754407
tf import 'module.subaccounts.aws_organizations_account.subaccount["Relationship Cloud Root"]' 535998799112
tf import 'module.subaccounts.aws_organizations_account.subaccount["dev"]' 434360104464

tf state rm 'aws_organizations_account.subaccount["wipro"]'
tf state rm 'aws_organizations_account.subaccount["varmour"]'
tf state rm 'aws_organizations_account.subaccount["ncs-datacom"]'
tf state rm 'aws_organizations_account.subaccount["Sandbox"]'


teamsre@varmour.com



tf import module.s3buckets.aws_s3_bucket.bucket rclouds3logdrive
tf import module.s3buckets.aws_s3_bucket.customer rcloud-vpcflowlogs
tf import module.s3buckets.aws_s3_bucket_lifecycle_configuration.expiration rclouds3logdrive