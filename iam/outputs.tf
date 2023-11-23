# iam/outputs.tf

output "terraform_role_arn" {
  value = aws_iam_role.terraform_role.arn
}

output "s3_cloudfront_policy_arn" {
  value = aws_iam_policy.s3_cloudfront_policy.arn
}

