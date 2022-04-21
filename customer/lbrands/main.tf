#Snapshot module
snapshot_retention = "6"
snapshot_interval = "12"
snapshot_interval_unit = "HOURS"
snapshot_time = ["05:00"]


module "instance_snapshots" {
  source                         = "../../modules/instance_snapshots"
  snapshot_retention = var.snapshot_retention
  snapshot_interval = var.snapshot_interval
  snapshot_interval_unit = var.snapshot_interval_unit
  snapshot_time = var.snapshot_time
  customer_name                  = var.customer_name
  environment_type               = var.environment_type
  common_tags                    = local.common_tags
  snapshot_tags                    = local.snapshot_tags
}

locals {
  snapshot_tags = {
    Environment = var.environment_type,
    Customer    = var.customer_name
  }
}

#snapshot
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
  type        = number
  default     = "12"
  description = "How often this lifecycle policy should be evaluated. 1, 2,3,4,6,8,12 or 24 are valid values."
}
variable "snapshot_time" {
  type        = list
  default     = ["04:00"]
  description = "A list of times in 24 hour clock format that sets when the lifecycle policy should be evaluated. Max of 1. in UTC TZ"
}
variable "snapshot_tags" {
  type    = map(string)
  default = {}
}
