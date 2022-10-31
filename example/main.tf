module "ec2-jenkins" {
    source                    = "git::https://github.com/tothenew/terraform-aws-jenkins.git"
    vpc_id                    = "vpc-999999999999"
    key_name                  = "key_name"
    instance_type             = "t2.micro"
    iam_instance_profile      = "test-role"
    security_groups           = ["sg-999999999999"]
    subnet_id                 = ["subnet-999999999999"]
    ebs_optimized             = false
    disable_api_termination   = true
    disable_api_stop          = true
    volume_type               = "gp3"
    root_volume_size          = 10
    project_name_prefix       = "dev-test"
    common_tags               = {
      "Project"     = "test",
      "Environment" = "dev"
    }
}