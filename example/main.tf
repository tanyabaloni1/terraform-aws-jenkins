module "ec2-jenkins" {
  source                    = "git::https://github.com/tothenew/terraform-aws-jenkins.git"
  vpc_id                    = "vpc-99999999999999999"
  key_name                  = "key_name"
  instance_type             = "t2.micro"
  iam_instance_profile      = "test-profile"
  security_groups           = ["sg-99999999999999999"]
  subnet_id                 = "subnet-99999999999999999"
  ebs_optimized             = false
  disable_api_termination   = true
  volume_type               = "gp3"
  root_volume_size          = 10
  project                   = "test-project"
  project_name_prefix       = "test"
  environment               = "test"
  tags                      = merge(local.common_tags, tomap({ "Name" : "${local.project_name_prefix}-jenkins" }))
}