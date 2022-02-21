variable "subaccount" {
  type        = map(map(string))
  description = "Subaccounts that need to be added"
}

variable "common_tags" {
  type    = map(string)
  default = {}
}

