# cloudfront/outputs.tf

output "distribution_domain_names" {
  value = { for k, v in aws_cloudfront_distribution.distribution : k => v.domain_name }
}

