# iam/main.tf

resource "aws_iam_policy" "s3_cloudfront_policy" {
  name        = "s3_cloudfront_policy_${var.environment}"
  path        = "/"
  description = "Policy for limited S3 and CloudFront access in ${var.environment} environment"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject",
          "s3:ListBucket",
        ],
        Effect   = "Allow",
        Resource = [
          "arn:aws:s3:::bucket1-${var.environment}/*",
          "arn:aws:s3:::bucket2-${var.environment}/*",
          "arn:aws:s3:::bucket3-${var.environment}/*",
        ]
      },
      {
        Action = [
          "cloudfront:GetDistribution",
          "cloudfront:UpdateDistribution",
        ],
        Effect = "Allow",
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role" "terraform_role" {
  name = "terraform_role_${var.environment}"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        },
      },
    ]
  })

  tags = {
    Environment = var.environment
  }
}

resource "aws_iam_role_policy_attachment" "attach_policy" {
  role       = aws_iam_role.terraform_role.name
  policy_arn = aws_iam_policy.s3_cloudfront_policy.arn
}

