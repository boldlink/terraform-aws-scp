locals {
  name = "minimum-scp-example"
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

module "minimum_example" {
  source     = "../../"
  name       = local.name
  content    = local.content
  target_ids = []
  tags = {
    environment        = "examples"
    name               = local.name
    "user::CostCenter" = "terraform-registry"
  }
}
