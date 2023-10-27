resource "aws_iam_policy" "this" {
  count = var.iam_policy_create ? 1 : 0
  name = var.policy_name
  description = var.policy_description
  policy = var.policy
  tags = var.policy_tags
}

variable "policy_name" {}
variable "policy_description" {}
variable "policy" {}
variable "policy_tags" {}
