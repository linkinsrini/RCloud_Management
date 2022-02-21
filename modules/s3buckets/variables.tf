
##### To share S3 bucket with other accounts to consolidate the vpc flow logs
variable "s3_shared_accounts" {
  type = list(any)
}

variable "common_tags" {
  type    = map(string)
  default = {}
}

