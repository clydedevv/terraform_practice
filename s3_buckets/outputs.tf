# s3_buckets/outputs.tf

output "auth_bucket_domain_name" {
  value = aws_s3_bucket.auth_bucket.bucket_domain_name
}

output "info_bucket_domain_name" {
  value = aws_s3_bucket.info_bucket.bucket_domain_name
}

output "customers_bucket_domain_name" {
  value = aws_s3_bucket.customers_bucket.bucket_domain_name
}

