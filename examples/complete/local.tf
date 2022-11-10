locals {
  name = "complete-example"
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

  tag_policy = jsonencode({
    "tags" : {
      "costcenter" : {
        "tag_key" : {
          "@@assign" : "costcenter"
        },
        "tag_value" : {
          "@@assign" : [
            "*"
          ]
        },
        "enforced_for" : {
          "@@assign" : [
            "ec2:instance"
          ]
        }
      },
      "team" : {
        "tag_key" : {
          "@@assign" : "Team"
        },
        "tag_value" : {
          "@@assign" : [
            "DevOps"
          ]
        },
        "enforced_for" : {
          "@@assign" : [
            "ec2:instance"
          ]
        }
      }
    }
  })
  tags = {
    Name               = local.name
    Environment        = "examples"
    "user::CostCenter" = "terraform"
    department         = "operations"
    instance-scheduler = false
    LayerName          = "c140-aws-scp"
    LayerId            = "c140"
  }

}
