
variable "AWS_REGION" {
  default     = "us-west-2"   #defining Region
  description = "AWS Region"
}

data "aws_availability_zones" "RB_VPC_AZS" {
  state = "available"         #defining Availability Zone
}

# # defining CIDR Block for VPC

variable "RB_VPC_CIDR" {
  default = "10.0.0.0/16" # Network Mask - 255.255.255.0 Addresses Available - 65532  #VPC CIDR
}

# defining Variables for Public Subnets

variable "cidr_block_RB_Public_Subnet1" {
  default = "10.0.1.0/24"    #Public Subnet-1
}

variable "cidr_block_RB_Public_Subnet2" {
  default = "10.0.2.0/24"    #Public Subnet-2
}

# defining Variables for Private Subnets

variable "cidr_block_RB_Private_Subnet1" {
  default = "10.0.3.0/24"    #Private Subnet-1
}

variable "cidr_block_RB_Private_Subnet2" {
  default = "10.0.4.0/24"    #Private Subnet-2
}

# # defining Variables for Public Route Table

variable "CIDR_BLOCK" {
  default = "0.0.0.0/0"    #Public CIDR
}

# defining Variables EC-2 Instance

variable "instance_type" {
 type = string
 default = "t3.micro"
}

# defining Variables for AMI

variable "AMI"{
    type = map(string)
    description = "Region specific AWS Machine Images (AMI)"
    default ={
        us-west-2 = "ami-0d2017e886fc2c0ab"
    }
}