region               = "ap-south-1"
profile              = "default"
key_name             = ""
project              = "test-project"
project_name_prefix  = "test-project"
environment          = "test"
instance_type        = "t2.micro"
iam_instance_profile = "ssm-role"
subnet_id            = ""
ebs_optimized        = "false"
root_volume_size     = "10"
security_groups      = [""]
vpc_id               = ""
common_tags = {
  "Feature" : "application"
}