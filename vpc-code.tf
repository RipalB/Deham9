# creating a VPC

resource "aws_vpc" "vpc-code" {
 cidr_block = "10.0.0.0/16"

 enable_dns_hostnames=true
 enable_dns_support = true
 
 tags = {
   Name = "RB-VPC"
 }
}

variable "vpc_cidr"{
    default = "10.0.0.0/16"
}