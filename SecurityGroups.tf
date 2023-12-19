
# # # Create Security Group for VPC

# resource "aws_security_group" "RB_VPC_SecurityGroup" { #allow_ssh_http
#   name   = "RB_VPC_SecurityGroup"
#   vpc_id = aws_vpc.RB_VPC.id


# provisioner "local-exec" {
#     command = "echo RB_VPC_SecurityGroup ID = ${self.id} >> metadata"
#   }
# }

# # #Define Ingress Rule - Inbound Rule (Inside traffic)

# # Ingress Security Port 22 (Inbound)
# resource "aws_security_group_rule" "RB_VPCSG_SSH_INGRESS" {
#   from_port         = 22
#   to_port           = 22
#   protocol          = "tcp"
#   security_group_id = aws_security_group.RB_VPC_SecurityGroup.id

#   type        = "ingress"
#   cidr_blocks = ["0.0.0.0/0"]
# }

# # # Ingress Security Port 80 (Inbound)
# resource "aws_security_group_rule" "RB_VPCSG_HTTP_INGRESS" {
#   from_port         = 80
#   to_port           = 80
#   protocol          = "tcp"
#   security_group_id = aws_security_group.RB_VPC_SecurityGroup.id

#   type        = "ingress"
#   cidr_blocks = ["0.0.0.0/0"]
# }

# # #Define egress Rule - Outbound Rule (Outside traffic)

# # # All egress/outbound Access

# resource "aws_security_group_rule" "RB_VPCSG_ALL_EGRESS" {
#   from_port         = 0
#   to_port           = 0
#   protocol          = "-1"
#   security_group_id = aws_security_group.RB_VPC_SecurityGroup.id

#   type        = "egress"
#   cidr_blocks = ["0.0.0.0/0"]
# }
