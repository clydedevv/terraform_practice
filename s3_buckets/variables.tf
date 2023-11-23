# s3_buckets/variables.tf

variable "environment" {
  description = "The deployment environment (dev, staging, prod)"
  type        = string
}

