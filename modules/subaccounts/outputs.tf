output "subaccount_ids" {
  value = flatten([
    for subaccount in aws_organizations_account.subaccount : subaccount.id
  ])
}


output "subaccount_names" {
  value = { for account, subaccount in aws_organizations_account.subaccount : account => subaccount.id }
}