module "ec2-jenkins" {
  source               = "git::https://github.com/tothenew/terraform-aws-jenkins.git"
  subnet_ids            = ["subnet-999999999999"]
}