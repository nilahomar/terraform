resource "aws_s3_bucket" "my_bucket" {
  bucket = "aws-learning-by-nila"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_website_configuration" "this" {
  bucket = aws_s3_bucket.my_bucket.id

  index_document {
    suffix = "index.html"
  }
}

output "my_bucket_domain_name" {
  value = aws_s3_bucket.my_bucket.bucket_domain_name
}

output "my_bucket_arn" {
  value = aws_s3_bucket.my_bucket.arn
}
