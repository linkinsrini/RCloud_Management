variable "customer_name" {
  type = string
}
variable "environment_type" {
  type        = string
  description = "Type of environment, use either 'dev', 'poc' or 'prod'."

  validation {
    condition     = contains(["dev", "poc", "prod"], var.environment_type)
    error_message = "Argument \"environment_type\" must be either \"dev\", \"poc\" or \"prod\"."
  }
}
variable "common_tags" {
  type = map(string)
}

variable "snapshot_retention" {
  type        = number
  default     = "6"
  description = "How many snapshots to keep. Must be an integer between 1 and 1000."
}

variable "snapshot_interval_unit" {
  type        = string
  default     = "HOURS"
  description = "The unit for how often the lifecycle policy should be evaluated."
}

variable "snapshot_interval" {
  type        = string
  default     = "12"
  description = "How often this lifecycle policy should be evaluated. 1, 2,3,4,6,8,12 or 24 are valid values."
}

variable "snapshot_time" {
  type        = list(any)
  default     = ["04:00"]
  description = "A list of times in 24 hour clock format that sets when the lifecycle policy should be evaluated. Max of 1. in UTC TZ"
}

variable "snapshot_tags" {
  type    = map(string)
  default = {}
}
