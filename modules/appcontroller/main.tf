resource "aws_network_interface" "ac-nic" {
  count           = var.ac_instance_count
  subnet_id       = var.ac_associate_public_ip_address == "true" ? element(var.pub_subnet, count.index) : element(var.pvt_subnet, count.index)
  private_ips     = [var.ac_private_ip]
  security_groups = [var.main_security_group]
  tags            = merge(var.common_tags, { Name = "${var.customer_name}-AC-${var.software_version}-${count.index + 1}" })
}
data "template_file" "user_data" {
  template = file("../../modules/appcontroller/bootstrap.sh")
  vars = {
    "CUSTOMER_NAME" = var.customer_name
    "ENV_NAME" =  var.environment_type
  }
}
resource "aws_instance" "ac" {
  count = var.ac_instance_count
  ami           = var.ac_ami
  instance_type = var.ac_instance_size
  network_interface {
    network_interface_id = aws_network_interface.ac-nic[count.index].id
    device_index         = 0
  }
  key_name = var.aws_key_pair_name
  user_data = data.template_file.user_data.rendered
  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }
  root_block_device {
    volume_type = var.ac_volume_type
    volume_size = var.ac_volume_size
    delete_on_termination = true
    encrypted = true
  }
  tags        = merge(var.common_tags, { Name = "${var.customer_name}-AC-${var.software_version}-${count.index + 1}" })
  volume_tags = merge(var.common_tags, { Name = "${var.customer_name}-AC-EBS-ROOT-VOLUME-${count.index + 1}" })
}