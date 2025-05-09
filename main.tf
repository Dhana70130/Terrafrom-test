terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-09887899"    # Replace with your S3 bucket
    key            = "s3/s3v1.terraform.tfstate" # Path in S3
    region         = "us-east-1"                    # AWS Region
    dynamodb_table = "terraform-lock"               # Enables state locking
    encrypt        = true                           # Encrypt state file
  }
}

provider "aws" {
  region = "us-east-1"  # Change to your preferred AWS region
}

resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket-tannvi"
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.example.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.example.id
  versioning_configuration {
    status = "Enabled"
  }
}