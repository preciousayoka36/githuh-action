variable "ami" {
  description = "aws ami"
  type        = string
  default     = "ami-0925fd223898ee5ba"

}



variable "aws_instance" {
  description = "the aws ec2 instance"
  type        = string
  default     = "t2.micro"
}



variable "region" {
  description = "aws region"
  type        = string
  default     = "us-west-1"
}

variable "ingressrules" {
  type    = list(number)
  default = [80,443,8080]

}

variable "egressrules" {
  type    = list(number)
  default = [80,443,25,3306,53,8080]

}

variable "key_pair" {
  type = string
  default = "syndykey"
  
}
