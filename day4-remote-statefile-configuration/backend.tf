terraform {
  backend "s3" {
    bucket = "state-remote-store123"
    key = "terraform.tfstate"
    region = "ap-south-1"
    
    
  }
}


