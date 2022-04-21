output "AC_Private_IP" {
  value = join(",", aws_instance.ac[*].private_ip)
}

output "AC_Public_IP" {
  value = join(",", aws_instance.ac[*].public_ip)
}