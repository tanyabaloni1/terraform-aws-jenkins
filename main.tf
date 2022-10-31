data "aws_ami" "amazon-linux-2" {
  most_recent = true
  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}
resource "aws_instance" "ec2" {
    ami                     = data.aws_ami.amazon-linux-2.id
    instance_type           = var.instance_type
    subnet_id               = var.subnet_id
    vpc_security_group_ids  = var.security_groups
    key_name                = var.key_name
    iam_instance_profile    = var.iam_instance_profile
    ebs_optimized           = var.ebs_optimized
    disable_api_termination = var.disable_api_termination
    disable_api_stop        = var.disable_api_stop
    user_data               = file("user_data.sh")

    volume_tags             = var.tags
    tags                    = var.tags

    root_block_device {
      delete_on_termination = var.delete_on_termination
      encrypted             = var.encrypted
      volume_size           = var.root_volume_size
      volume_type           = var.volume_type
    }
}
