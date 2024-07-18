resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}

resource "aws_s3_bucket" "main" {
  bucket = "my-unique-bucket-name-${random_string.suffix.result}"

  tags = {
    Name = "My unique bucket"
  }
}
