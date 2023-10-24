#creating Private Route Table


resource "aws_route_table" "private_route" {
 vpc_id = aws_vpc.vpc-code.id
 
 route {
   cidr_block = "0.0.0.0/0"
   gateway_id = aws_internet_gateway.gw.id
 }
 
 tags = {
   Name = "RB-Private-RouteTable"
 }
}



# creating Public Route Table
resource "aws_route_table" "public_route"{
    vpc_id = aws_vpc.vpc-code.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.gw.id
    }
    tags = {
      Name = "RB-Public-RouteTable"  
    }
}

#Associate Public Subnet to Public Route Table

resource "aws_route_table_association" "public_subnet_asso" {
 count = length(var.public_subnet_cidrs)
 subnet_id      = element(aws_subnet.public_subnets[*].id, count.index)
 route_table_id = aws_route_table.public_route.id
}

#Associate Private Subnet to Private Route Table

resource "aws_route_table_association" "private_subnet_asso" {
 count = length(var.private_subnet_cidrs)
 subnet_id      = element(aws_subnet.private_subnets[*].id, count.index)
 route_table_id = aws_route_table.private_route.id
}