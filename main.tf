terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.76.1"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "bucket-aula" {
  bucket = "bucket-challange-terraform-challange-web-02"

  website {
    index_document = "index.html"
  }
}

resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.bucket-aula.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.bucket-aula.id
  policy = file("${path.module}/policy.json")

  depends_on = [aws_s3_bucket_public_access_block.public_access]
}

output "website_url" {
  description = "URL pública del sitio web"
  value       = aws_s3_bucket.bucket-aula.website_endpoint
}