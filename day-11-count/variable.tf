variable "ami" {
    type = string
    default = "dev"
  
}

variable "instance_type" {
    type = string
    default = "ved"
  
}

variable "key_name" {
    type = string
    default = "titu"
  
}

variable "count" {
    type = string
    default = ["prod,test"]
  
}
