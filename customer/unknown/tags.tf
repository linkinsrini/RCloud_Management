# Tag Generation
locals {
  common_tags = {
    Environment = var.environment_type,
    Customer    = var.customer_name,
    Release     = var.software_version,
    Created_by  = var.created_by,
    dynamictag  = "true"
  }
}