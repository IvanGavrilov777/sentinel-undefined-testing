resource "aws_iam_policy" "this" {
  count = var.iam_policy_create ? 1 : 0
  name = var.policy_name
  path = var.policy_path
  description = var.policy_description
  policy = var.policy
  tags = var.policy_tags
}