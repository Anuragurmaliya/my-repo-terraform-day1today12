resource "aws_instance" "dependency" { 
    ami = "ami-0cc9838aa7ab1dce7" 
    instance_type = "t2.micro" 
    key_name = "anuragkey3" 
    tags = { 
      Name="dependency" 
    } 
  depends_on = [aws_s3_bucket.dependency] # it is create first s3 dependency
  
} 
 
resource "aws_s3_bucket" "dependency" { 
    bucket = "dependecny-s3-practice" 
    
   
}
