variable "project" {
    description = "A string value for tag as Project Name"
    type        = string
}

variable "common_tags" {
    description = "A map to add common tags to all the resources"
    type        = map(string)
}

variable "project_name_prefix" {
    description = "A string value to describe prefix of all the resources"
    type        = string
}

variable "region" {
    description = "A string value for Launch resources in which AWS Region."
    type        = string
}

variable "profile" {
    description = "A string value for setting AWS Profile."
    type        = string
}

variable "environment" {}

variable "vpc_id" {}

variable "subnet_id" {}

variable "instance_type" {}

variable "iam_instance_profile" {}

variable "key_name" {}

variable "disable_api_termination" {
    default     = true
}

variable "ebs_optimized" {
    default     = false
}

variable "security_groups" {
    type        = list(string)
}

variable "source_dest_check" {
    default     = true
}

variable "delete_on_termination" {
    default     = true
}

variable "encrypted" {
    default     = true
}

variable "volume_type" {
    default     = "gp3"
}

variable "root_volume_size" {}

variable "ec2_device_names" {
    type        = list(string)
}

variable "ec2_ebs_volume_count" {}

variable "ec2_ebs_volume_size" {
    type        = list(number)
}

variable "ec2_ebs_volume_type" {}