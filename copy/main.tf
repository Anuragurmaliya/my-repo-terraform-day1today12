#create vpc 
resource "aws_vpc" "ved" {
    cidr_block = "10.0.0.0/16"
    
    tags = {
        Name = "my-cus-vpc"
    }
  
}


#create subnet
resource "aws_subnet" "ved" {
    cidr_block = "10.0.0.0/24"
    vpc_id = aws_vpc.ved.id
    availability_zone = "ap-south-1a"
    tags = {
      Name = "my-pub-sub"
    }
  
}

#create internet gateway and attach to vpc
resource "aws_internet_gateway" "ved" {
  vpc_id = aws_vpc.ved.id
  tags = {
    Name = "cus-ig-gateway"
  }
}

#create Route table and give internet gateway(edit routes)
resource "aws_route_table" "ved" {
    vpc_id = aws_vpc.ved.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.ved.id
    }
}
#subnet assosiation to add into RT (public)
resource "aws_route_table_association" "ved" {
    subnet_id = aws_subnet.ved.id
    route_table_id = aws_route_table.ved.id
    
  
}

#security group 
resource "aws_security_group" "ved" {
    name = "allow_tls"
    vpc_id = aws_vpc.ved.id

    tags = {
    Name = "ved_sg"
  }
ingress {
    description = "TLS from Vpc"
  from_port = "22"
  to_port =  "22"
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

egress {
    description = "TLS from vpc"
    from_port = "0"
    to_port = "0"
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]

}




}

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