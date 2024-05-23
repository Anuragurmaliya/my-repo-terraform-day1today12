#aws instance
resource "aws_instance" "ved" {
    ami = var.ami_id
  instance_type = var.instance_type
  key_name = var.keyname
  vpc_security_group_ids = [aws_security_group.ved.id ]
  subnet_id = aws_subnet.ved.id

  tags = {
    Name = "hanu"
  }

}