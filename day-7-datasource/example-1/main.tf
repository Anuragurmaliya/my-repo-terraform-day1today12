provider "aws" {
    region = "ap-south-1"
  
}

data "aws_subnet" "selected" {
    filter {
    name = "tag:Name"
    values = ["subnet-2"]
    }
  
}

resource "aws_instance" "tes1" {
    ami = "ami-0cc9838aa7ab1dce7"
    key_name = "anuragkey3"
    instance_type = "t2.micro"
    subnet_id = data.aws_subnet.selected.id
   tags = {
     Name = "hanu"
   }
}