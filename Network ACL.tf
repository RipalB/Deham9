
# # Create VPC - Network access control list

# resource "aws_network_acl" "RB_VPC_NACL" {
#   vpc_id     = aws_vpc.RB_VPC.id
#   subnet_ids = [aws_subnet.RB_Public_Subnet1.id, aws_subnet.RB_Public_Subnet2.id]

#   #Define Ingress Rule - Inbound Rule (Inside traffic)
#   # allow ingress port 22
#   ingress {
#     protocol   = "tcp"
#     rule_no    = 100
#     action     = "allow"
#     cidr_block = "0.0.0.0/0"
#     from_port  = 22
#     to_port    = 22
#   }

#   # allow ingress port 80 
#   ingress {
#     protocol   = "tcp"
#     rule_no    = 200
#     action     = "allow"
#     cidr_block = "0.0.0.0/0"
#     from_port  = 80
#     to_port    = 80
#   }


#   #Define egress Rule - Outbound Rule (Outside traffic)

#   # allow egress port 22 
#   egress {
#     protocol   = "tcp"
#     rule_no    = 100
#     action     = "allow"
#     cidr_block = "0.0.0.0/0"
#     from_port  = 22
#     to_port    = 22
#   }

#   # allow egress port 80 
#   egress {
#     protocol   = "tcp"
#     rule_no    = 200
#     action     = "allow"
#     cidr_block = "0.0.0.0/0"
#     from_port  = 80
#     to_port    = 80
#   }


#   tags = {
#     Name = "RB_VPC_NACL"
#   }
# }

# #Association with Public Subnets 1 & 2

# resource "aws_network_acl_association" "RB_VPC_NACL_PublicSubnet1" {
#   network_acl_id = aws_network_acl.RB_VPC_NACL.id
#   subnet_id      = aws_subnet.RB_Public_Subnet1.id
# }

# resource "aws_network_acl_association" "RB_VPC_NACL_PublicSubnet2" {
#   network_acl_id = aws_network_acl.RB_VPC_NACL.id
#   subnet_id      = aws_subnet.RB_Public_Subnet2.id
# }