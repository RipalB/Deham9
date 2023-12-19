# # creating Public Route Table
# resource "aws_route_table" "RB_Public_RouteTable" {
#   vpc_id = aws_vpc.RB_VPC.id

#   route {
#     cidr_block = var.CIDR_BLOCK
#     gateway_id = aws_internet_gateway.RB_Internet_Gateway.id
#   }
#   tags = {
#     Name = "RB_Public_RouteTable"
#   }

#   provisioner "local-exec" {
#     command = "echo RB_Public_RouteTable ID = ${self.id} >> metadata"
#   }
# }

# # Creating Private Route Table

# resource "aws_route_table" "RB_Private_RouteTable" {
#   vpc_id = aws_vpc.RB_VPC.id

#   route {
#     cidr_block = var.CIDR_BLOCK
#     gateway_id = "local"
#   }
#   tags = {
#     Name = "RB_Private_RouteTable"
#   }
#   provisioner "local-exec" {
#     command = "echo RB_Private_RouteTable ID = ${self.id} >> metadata"
#   }
# }

# #Associate Public Subnet to Public Route Table

# resource "aws_route_table_association" "Public_Subnet1_Asso" {
#   route_table_id = aws_route_table.RB_Public_RouteTable.id
#   subnet_id      = aws_subnet.RB_Public_Subnet1.id
#   depends_on     = [aws_route_table.RB_Public_RouteTable, aws_subnet.RB_Public_Subnet1]
# }

# resource "aws_route_table_association" "Public_Subnet2_Asso" {
#   route_table_id = aws_route_table.RB_Public_RouteTable.id
#   subnet_id      = aws_subnet.RB_Public_Subnet2.id
#   depends_on     = [aws_route_table.RB_Public_RouteTable, aws_subnet.RB_Public_Subnet2]
# }

# #Associate Private Subnet to Private Route Table

# resource "aws_route_table_association" "Private_Subnet1_Asso" {
#   route_table_id = aws_route_table.RB_Private_RouteTable.id
#   subnet_id      = aws_subnet.RB_Private_Subnet1.id
#   depends_on     = [aws_route_table.RB_Private_RouteTable, aws_subnet.RB_Private_Subnet1]
# }

# resource "aws_route_table_association" "Private_Subnet2_Asso" {
#   route_table_id = aws_route_table.RB_Private_RouteTable.id
#   subnet_id      = aws_subnet.RB_Private_Subnet2.id
#   depends_on     = [aws_route_table.RB_Private_RouteTable, aws_subnet.RB_Private_Subnet2]
# }