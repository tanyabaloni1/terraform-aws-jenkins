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
}

resource "aws_ebs_volume" "ebs_volume" {
  count             = var.ec2_ebs_volume_count
  availability_zone = "${element(aws_instance.ec2.*.availability_zone, count.index)}"
  size              = "${element(var.ec2_ebs_volume_size, count.index)}"
  type              = var.ec2_ebs_volume_type
}

resource "aws_volume_attachment" "volume_attachement" {
  count       = var.ec2_ebs_volume_count
  volume_id   = "${aws_ebs_volume.ebs_volume.*.id[count.index]}"
  device_name = "${element(var.ec2_device_names, count.index)}"
  instance_id = "${element(aws_instance.ec2.*.id, count.index)}"
}