module "practice-module" {
    source = "../day-8-module"
    ami = "ami-0cc9838aa7ab1dce7"
    instance_type = "t2.micro"
    key_name = "anuragkey3"
 
  
}


#we are take the value in module-day-8