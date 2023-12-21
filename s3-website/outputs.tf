output "this" {
  value = aws_s3_bucket.this.bucket_domain_name
}

output "website_endpoint" {
  value = aws_s3_bucket_website_configuration.this.website_endpoint
}
