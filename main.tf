################################################################################
#                           *** AWS IAM Policy ***                             #
################################################################################

data "template_file" "bm-aws-ue1-p1-ldzshs-pl-test-01" {
  template = file(join("", ["./policy.json.tpl"]))
}

module "bm-aws-ue1-p1-ldzshs-pl-test-01" {
  source              = "./pesho"
  policy_name         = "bm-aws-ue1-p1-ldzshs-pl-test-01"
  policy_description  = "Test"
  policy_tags = {
    Name              = "bm-aws-ue1-p1-ldzshs-pl-test-01"
    deployment_type   = "terraform"
    owner             = "team_owner"
  }
  policy              = data.template_file.bm-aws-ue1-p1-ldzshs-pl-test-01.rendered
}

# terraform {
#     cloud {
#         organization = "healthy-organ"
#         workspaces {
#           name = "sentinel-undefined-testing"
#         }
#     }
# }