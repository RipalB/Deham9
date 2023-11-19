# # Creating Public Subnets

# # Public Subnet-1

# resource "aws_subnet" "RB-Public-Subnet1"{
#   cidr_block              = var.cidr_block_rb_public_subnet1
#   vpc_id                  = aws_vpc.rb_vpc.id
#   map_public_ip_on_launch = true
#   availability_zone       = data.aws_availability_zones.rb_vpc_azs.names[1]
#   tags ={
#     Name = "RB-Public-Subnet1
#     }
    
#     provisioner "local-exec"{
#     command                = "echo Public Subnet1 = ${self.id} >> metadata"
#   }
#  }

# #Public Subnet-2

# resource "aws_subnet" "RB-Public-Subnet2"{
#   cidr_block              = var.cidr_block_rb_public_subnet2
#   vpc_id                  = aws_vpc.rb_vpc.id
#   map_public_ip_on_launch = true
#   availability_zone       = data.aws_availability_zones.rb_vpc_azs.names[1]

#   tags ={
#     Name = "RB-Public-Subnet2"
#   }
# }

# # Creating Private Subnets

# # Private Subnet-1

# resource "aws_subnet" "RB-Private-Subnet1"{
#   cidr_block              = var.cidr_block_rb_private_subnet1
#   vpc_id                  = aws_vpc.rb_vpc.id
#   map_public_ip_on_launch = false
#   availability_zone       = data.aws_availability_zones.rb_vpc_azs.names[1]

#   tags ={
#     Name = "RB-Private-Subnet1"
#   }
# }

# # Private Subnet-2

# resource "aws_subnet" "RB-Private-Subnet2"{
#   cidr_block              = var.cidr_block_rb_private_subnet2
#   vpc_id                  = aws_vpc.rb_vpc.id
#   map_public_ip_on_launch = false
#   availability_zone       = data.aws_availability_zones.rb_vpc_azs.names[1]

#   tags ={
#     Name = "RB-Private-Subnet2"
#   }
# }