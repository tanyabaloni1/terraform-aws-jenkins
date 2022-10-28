resource "aws_instance" "ec2" {
  ami                     = var.ami_id
  instance_type           = var.instance_type
  subnet_id               = var.subnet_id
  vpc_security_group_ids  = var.security_groups
  key_name                = var.key_name
  iam_instance_profile    = var.iam_instance_profile
  ebs_optimized           = var.ebs_optimized
  disable_api_termination = var.disable_api_termination
  user_data_base64        = base64encode(var.user_data_script)
  source_dest_check       = var.source_dest_check

  volume_tags = var.tags
  tags        = var.tags

  root_block_device {
    delete_on_termination = var.delete_on_termination
    encrypted             = var.encrypted
    volume_size           = var.root_volume_size
    volume_type           = var.volume_type
  }
  dynamic "ebs_block_device" {
    for_each = var.ebs_block_device
    content {
      delete_on_termination = var.ebs_delete_on_termination
      device_name           = ebs_block_device.value.device_name
      encrypted             = lookup(ebs_block_device.value, "encrypted", null)
      iops                  = lookup(ebs_block_device.value, "iops", null)
      volume_size           = lookup(ebs_block_device.value, "volume_size", null)
      volume_type           = lookup(ebs_block_device.value, "volume_type", null)
    }
  }
}