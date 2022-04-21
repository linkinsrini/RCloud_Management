variable "ac_instance_count" {
  type = string
}

variable "customer_name" {
  type = string
}

variable "environment_type" {
  type        = string
  description = "Type of environment, use either 'dev', 'poc' or 'prod' or 'production'."

  validation {
    condition     = contains(["dev", "poc", "prod", "production"], var.environment_type)
    error_message = "Argument \"environment_type\" must be either \"dev\", \"poc\" or \"production\"."
  }
}

variable "software_version" {
  type = string
}

variable "ac_ami" {
  type        = string
  description = "AMI to use for Application Controller."
}

variable "ac_instance_size" {
  type        = string
  description = "AWS EC2 instance type to use for Application Controller."
}

variable "common_tags" {
  type = map(string)
}

variable "aws_key_pair_name" {
  type = string
}

variable "main_security_group" {
  type = string
}

variable "pub_subnet" {
  description = "CIDRs of subnets inside VPC."
}

variable "pvt_subnet" {
  description = "CIDRs of subnets inside VPC."
}

variable "ac_associate_public_ip_address" {
  type = string
}

variable "ac_volume_type" {
  type        = string
  default     = "gp2"
  description = "add root block storage to the ac machine."
}

variable "ac_volume_size" {
  type        = string
  default     = "256"
  description = "root block storage size of the ac machine."
}

variable "ac_private_ip" {
  type = string
}
