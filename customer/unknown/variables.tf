
variable "subaccount" {
  type        = map(map(string))
  description = "Subaccounts that need to be added"
  default = {
    "ncs-datacom" = {
      name  = "ncs-datacom"
      email = "ncs-datacom@varmour.com"
    }
  }
}



variable "software_version" {
  type        = string
  description = "Major version number of vArmour Application Controller being deployed."
}

variable "customer_name" {
  type        = string
  description = "Customer Name. If deploying internally for vArmour, put in your username."
}

variable "created_by" {
  type        = string
  description = "put in your username along with terraform."
}

variable "environment_type" {
  type        = string
  description = "Type of environment, use either 'dev', 'poc' or 'production'."

  validation {
    condition     = contains(["dev", "poc", "prod", "qa", "stage"], var.environment_type)
    error_message = "Argument \"environment_type\" must be either \"dev\", \"poc\", \"qa\", \"stage\" or \"prod\"."
  }
}

variable "common_tags" {
  type    = map(string)
  default = {}
}
