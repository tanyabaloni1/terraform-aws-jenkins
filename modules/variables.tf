variable subnet_id {}

variable "ami_id" {}

variable "instance_type" {}

variable "iam_instance_profile" {}

variable "user_data_script" {}

variable "key_name" {}

variable "disable_api_termination" {}

variable "ebs_optimized" {}

variable "security_groups" {
  type = list(string)
}

variable "tags" {
  type = map(string)
}

variable "source_dest_check" {
  default = true
}

variable "delete_on_termination" {
  default = true
}

variable "encrypted" {
  default = true
}

variable "volume_type" {}

variable "root_volume_size" {}

variable "vpc_id" {}

#variable "ebs_block_device" {
#
#}

variable "ec2_device_names" {
  default = [
    "/dev/sdd",
    "/dev/sde",
    "/dev/sdf"
  ]
}

variable "ec2_ebs_volume_count" {
  default = 3
}

#variable "ec2_ebs_availability_zone" {
#  default = "us-east-1a"
#}

variable "ec2_ebs_volume_type" {
  default = "gp3"
}

variable "ec2_ebs_volume_size" {
  default = [
    5,
    5,
    7
  ]
}

