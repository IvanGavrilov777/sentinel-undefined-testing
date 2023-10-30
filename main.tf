################################################################################
#                           *** AWS IAM Policy ***                             #
################################################################################

data "template_file" "bm-aws-ue1-p1-ldzshs-pl-test-01" {
  template = file(join("", ["./policy.json.tpl"]))
}
locals {
  template = data.template_file.bm-aws-ue1-p1-ldzshs-pl-test-01.rendered
}
module "bm-aws-ue1-p1-ldzshs-pl-test-01" {
  source              = "./pesho"
  iam_policy_create   = true
  policy_name         = "bm-aws-ue1-p1-ldzshs-pl-test-01"
  policy_description  = "Test"
  policy_tags = {
    Name              = "bm-aws-ue1-p1-ldzshs-pl-test-01"
    deployment_type   = "terraform"
    owner             = "team_owner"
  }
policy = data.template_file.bm-aws-ue1-p1-ldzshs-pl-test-01.rendered
/*
  policy              = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
*/
  #policy = local.template

}
#123
# terraform {
#     cloud {
#         organization = "healthy-organ"
#         workspaces {
#           name = "sentinel-undefined-testing"
#         }
#     }
# }
