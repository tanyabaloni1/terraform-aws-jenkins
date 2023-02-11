module "ec2-jenkins" {
  source               = "git::https://github.com/tothenew/terraform-aws-jenkins.git"
  key_name             = "tothenew"
  subnet_ids            = ["subnet-999999999999"]
  project_name_prefix  = "dev-tothenew"
  common_tags = {
    "Project"     = "ToTheNew",
    "Environment" = "dev"
  }
}