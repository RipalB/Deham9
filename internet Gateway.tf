# Creating Internet Gateway

#create Internet Gateway

resource "aws_internet_gateway" "gw" {
 vpc_id = aws_vpc.vpc-code.id
 
 tags = {
   Name = "RB-Internet-Gateway"
 }
}