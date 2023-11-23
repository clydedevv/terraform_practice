provider "aws" {
  region = "eu-central-1"
}

# Variables
variable "environment" {
  description = "The deployment environment (dev, staging, prod)"
  type        = string
  default     = "dev"  # Default can be changed or passed at runtime
}

# S3 Buckets Module
module "s3_buckets" {
  source      = "./s3_buckets"
  environment = var.environment
}

# IAM Module
module "iam" {
  source      = "./iam"
  environment = var.environment
}

# CloudFront Module
module "cloudfront" {
  source = "./cloudfront"
  s3_bucket_domain_names = {
    "auth-${var.environment}"     = module.s3_buckets.auth_bucket_domain_name
    "info-${var.environment}"     = module.s3_buckets.info_bucket_domain_name
    "customers-${var.environment}" = module.s3_buckets.customers_bucket_domain_name
  }
}

# Outputs in main.tf

# S3 Bucket Domain Names from the s3_buckets module
output "auth_bucket_domain_name" {
  value = module.s3_buckets.auth_bucket_domain_name
}

output "info_bucket_domain_name" {
  value = module.s3_buckets.info_bucket_domain_name
}

output "customers_bucket_domain_name" {
  value = module.s3_buckets.customers_bucket_domain_name
}

# IAM Role ARN from the iam module
output "terraform_role_arn" {
  value = module.iam.terraform_role_arn
}

# IAM Policy ARN from the iam module
output "s3_cloudfront_policy_arn" {
  value = module.iam.s3_cloudfront_policy_arn
}

# CloudFront Distribution Domain Names from the cloudfront module
output "cloudfront_distribution_domain_names" {
  value = module.cloudfront.distribution_domain_names
}

