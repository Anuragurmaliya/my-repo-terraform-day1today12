locals {
  bucket-name = "${var.mydse}-${var.layer}-anurag"
}





resource "aws_s3_bucket" "urm" {
  bucket = local.bucket-name

  tags = {
    name= local.bucket-name
    
  }
  
}
 
  

