# Provider-1 for ap-south-1 (Default Provider)

provider "aws" {
    region = "ap-south-1"
  
}
#Another provider alias
provider "aws" {
    region = "us-east-1"
    alias = "anurag"
  
}

resource "aws_s3_bucket" "multiprovider" {
    bucket = "inidiedidend"

  
}

resource "aws_s3_bucket" "test2" {
    bucket = "hdiidd"
    provider = aws.anurag #provider.value of alias
}