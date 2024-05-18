resource "aws_instance" "user1" {
    ami = "ami-0cc9838aa7ab1dce7"

  instance_type = "t2.micro"
  key_name = "anuragkey3"
  tags = {
    Name = "anurag"
  } 
  user_data = file("test.sh")

}