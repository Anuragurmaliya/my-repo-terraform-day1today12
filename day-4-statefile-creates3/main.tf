resource "aws_s3_bucket" "remote" {
    bucket = "state-remote-store123"

  
}

resource "aws_s3_bucket_versioning" "example" {
    bucket = aws_s3_bucket.remote.id
    versioning_configuration {
      status = "Enabled"
    }

  
}

resource "dynamo_db" "name" {
  
}