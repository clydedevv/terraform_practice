# cloudfront/variables.tf

variable "s3_bucket_domain_names" {
  description = "Map of S3 bucket domain names for each path and environment"
  type        = map(string)
}

