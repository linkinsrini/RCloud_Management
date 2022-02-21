# TODO Reference code for future accounts.
resource "aws_organizations_account" "subaccount" {
  for_each  = var.subaccount
  name      = each.value.name
  email     = each.value.email
  parent_id = "ou-qp1q-fn1baawb"
  tags      = var.common_tags
}