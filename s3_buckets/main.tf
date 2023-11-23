# s3_buckets/main.tf

resource "aws_s3_bucket" "auth_bucket" {
  bucket = "ionnet-clyde-bucket1-${var.environment}"
}

resource "aws_s3_bucket_versioning" "auth_bucket_versioning" {
  bucket = aws_s3_bucket.auth_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "auth_bucket_sse" {
  bucket = aws_s3_bucket.auth_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket" "info_bucket" {
  bucket = "ionnet-clyde-bucket2-${var.environment}"
}


resource "aws_s3_bucket_versioning" "info_bucket_versioning" {
  bucket = aws_s3_bucket.info_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}


resource "aws_s3_bucket_server_side_encryption_configuration" "info_bucket_sse" {
  bucket = aws_s3_bucket.info_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket" "customers_bucket" {
  bucket = "ionnet-clyde-bucket3-${var.environment}"
}

resource "aws_s3_bucket_versioning" "customers_bucket_versioning" {
  bucket = aws_s3_bucket.customers_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "customers_bucket_sse" {
  bucket = aws_s3_bucket.customers_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

