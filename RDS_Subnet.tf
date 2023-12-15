
# #creating DB Subnet Group

# resource "aws_db_subnet_group" "RB_SubnetGroup" {
#   name       = "rb_subnetgroup"
#   subnet_ids = [aws_subnet.RB_Private_Subnet1.id, aws_subnet.RB_Private_Subnet2.id]

#   tags = {
#     Name = "RB_SubnetGroup"
#   }
# }