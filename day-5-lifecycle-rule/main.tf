 resource "aws_instance" "test" {
    ami = "ami-0e4fd655fb4e26c30"
    instance_type = "t3.micro"
    key_name = "anuragkey3"
    tags = {
      Name = "test10"
    }
    

    
  

  #below examples are for lifecycle meta_arguments 

 lifecycle {
    create_before_destroy = true    #this attribute will create the new object first and then destroy the old one
  }

#lifecycle {
 #  prevent_destroy = true    #Terraform will error when it attempts to destroy a resource when this is set to true:
 #}

  # lifecycle {
   #  ignore_changes = [tags,] #This means that Terraform will never update the object but will be able to create or destroy it.
   #}
 }
