# cloudfront/main.tf

locals {
  viewer_protocol_policy = { for key in keys(var.s3_bucket_domain_names) : key => (contains(split("", key), "prod") ? "https-only" : "redirect-to-https") }
}

resource "aws_cloudfront_distribution" "distribution" {
  for_each = var.s3_bucket_domain_names

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"

  origin {
    domain_name = each.value
    origin_id   = "S3-${each.key}"

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.oai[each.key].cloudfront_access_identity_path
    }
  }

  default_cache_behavior {
    target_origin_id = "S3-${each.key}"

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = local.viewer_protocol_policy[each.key]
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400

    allowed_methods = ["GET", "HEAD", "OPTIONS"]
    cached_methods  = ["GET", "HEAD"]
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
}

resource "aws_cloudfront_origin_access_identity" "oai" {
  for_each = var.s3_bucket_domain_names

  comment = "OAI for ${each.key}"
}

