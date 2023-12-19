
# # Creating Internet Gateway

# resource "aws_internet_gateway" "RB_Internet_Gateway" {
#   vpc_id = aws_vpc.RB_VPC.id

#   tags = {
#     Name = "RB_Internet_Gateway"
#   }
# }