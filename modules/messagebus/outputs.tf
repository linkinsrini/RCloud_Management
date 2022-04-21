output "MB_Private_IP" {
  value = join(",", aws_instance.mb[*].private_ip)
}

output "MB_Public_IP" {
  value = join(",", aws_instance.mb[*].public_ip)
}