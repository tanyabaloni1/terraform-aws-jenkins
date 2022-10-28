variable "project" {}
variable "common_tags" {
  type = map(string)
}
variable "project_name_prefix" {
}
variable "region" {}
variable "profile" {}
variable "environment" {}
variable "vpc_id" {}
variable "subnet_id" {}
variable "instance_type" {}
variable "iam_instance_profile" {}
variable "key_name" {}
variable "disable_api_termination" {
  default = true
}
variable "ebs_optimized" {
  default = false
}
variable "security_groups" {
  type = list(string)
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
variable "volume_type" {
  default = "gp3"
}
variable "root_volume_size" {
  default = 10
}

variable "block_device" {
  type        = list(any)
  default     = {
    device_name = "/dev/sdf"
    volume_type = "gp3"
    volume_size = 5
    encrypted   = true
  }
}