locals {
  name = "complete-scp-example"
  content = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "RequireMicroInstanceType",
        "Effect" : "Deny",
        "Action" : "ec2:RunInstances",
        "Resource" : [
          "arn:aws:ec2:*:*:instance/*"
        ],
        "Condition" : {
          "StringNotEquals" : {
            "ec2:InstanceType" : "t2.micro"
          }
        }
      }
    ]
    }
  )
}

data "aws_organizations_organization" "org" {}

module "complete_example" {
  source     = "../../"
  name       = local.name
  content    = local.content
  target_ids = [data.aws_organizations_organization.org.non_master_accounts[0].id]
  tags = {
    environment        = "examples"
    name               = local.name
    "user::CostCenter" = "terraform-registry"
  }
}
