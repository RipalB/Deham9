
# # Allowing SSH Traffic to database
# resource "aws_security_group" "RB_DB_SecurityGroup_AllowSSH" {
#   name        = "RB_DB_SecurityGroup_AllowSSH"
#   vpc_id      = aws_vpc.RB_VPC.id
#   description = "Allow SSH traffic"
#   ingress {
#     description = "allow SSH"
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   tags = {
#     Name = "RB_DB_SecurityGroup"
#   }
#   provisioner "local-exec" {
#     command = "echo RB_DB_SecurityGroup = ${self.id} >> metadata"
#   }
# }

# #Allowing EC2 Traffic to Aurora
# resource "aws_security_group" "RB_Allow_EC2_Aurora" {
#   name        = "RB_Allow_EC2_Aurora"
#   description = "Allow EC2 to Aurora traffic"
#   vpc_id      = aws_vpc.RB_VPC.id

#   ingress {
#     description = "allow ec2 to aurora"
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 3306
#     to_port     = 3306
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   tags = {
#     Name = "RB_Allow_EC2_Aurora"
#   }
# }

# # Allowing EC2 to Aurora Access
# resource "aws_security_group" "RB_Allow_Aurora_Access" {
#   name        = "RB_Allow_Aurora_Access"
#   description = "Allow EC2 to aurora"
#   vpc_id      = aws_vpc.RB_VPC.id

#   ingress {
#     from_port       = 3306
#     to_port         = 3306
#     protocol        = "tcp"
#     security_groups = [aws_security_group.RB_DB_SecurityGroup_AllowSSH.id]
#   }

#   tags = {
#     Name = "RB_Allow_Aurora_Access"
#   }
# }