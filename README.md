# terraform-aws-jenkins

## Usage

```
module "ec2-jenkins" {
    source                    = "git::https://github.com/tothenew/terraform-aws-jenkins.git"
    key_name                  = "key_name"
    iam_instance_profile      = "test-role"
    security_groups           = ["sg-999999999999"]
    subnet_id                 = "subnet-999999999999"
    project_name_prefix       = "dev-tothenew"
    common_tags               = {
      "Project"     = "ToTheNew",
      "Environment" = "dev"
    }
}
```

<!--- BEGIN_TF_DOCS --->

<!--- END_TF_DOCS --->