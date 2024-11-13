resource "aws_instance" "name" {  #first run ith resource block then import these details anothe resource block
    ami = "ami-0cc9838aa7ab1dce7" # we can not create one more resource like s3 bucket
    instance_type = "t3.micro"    # if s3 we are creating new main.tf and new resource block created
    key_name = "anuragkey3"
    tags = {
      Name = "sgyss"
    }
  
}

#resource "aws_instance" "myvm" {
 #ami           = "unknown"#(we need to add from state file reference)
 #instance_type = "unknown"#(we need to add from state file reference)
 #rest all attributes need to be added to match actual resource preseence in AWS 
#}


# Command 
#terraform import aws_instance.myvm  <instance id> 

#Note : Here instance id is manually crrated onw 
