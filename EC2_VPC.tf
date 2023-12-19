
# # # EC-2 Creation in VPC

# # Define the AMI ID for your EC2 instance (Amazon Linux 2)
# data "aws_ami" "latest_amazon_linux" {
#   most_recent = true
#   owners      = ["amazon"]

#   filter {
#     name   = "name"
#     values = ["amzn2-ami-hvm-*-x86_64-gp2"]
#   }
# }

# # Define the EC2 Instance-1 as a Web Server
# resource "aws_instance" "RB_EC2_Instance1" {
#   ami                    = data.aws_ami.latest_amazon_linux.id
#   instance_type          = "t3.micro"                                  # key pair name
#   subnet_id              = aws_subnet.RB_Public_Subnet1.id              # subnet ID
#   vpc_security_group_ids = [aws_security_group.RB_VPC_SecurityGroup.id] # security group ID

#   tags = {
#     Name = "RB_EC2_Instance1"
#   }
# }
# # Output the public IP address of the EC2 instance
# output "RB_EC2_Instance1_Public_IP" {
#   value = aws_instance.RB_EC2_Instance1.public_ip
# }


# # Define the EC2 Instance-2
# resource "aws_instance" "RB_EC2_Instance2" {
#   ami                    = data.aws_ami.latest_amazon_linux.id
#   instance_type          = "t3.micro"                                   # key pair name
#   subnet_id              = aws_subnet.RB_Private_Subnet1.id             # subnet ID
#   vpc_security_group_ids = [aws_security_group.RB_VPC_SecurityGroup.id] # security group ID

#   tags = {
#     Name = "RB_EC2_Instance2"
#   }
# }
# # Output the public IP address of the EC2 instance
# output "RB_EC2_Instance2_Public_IP" {
#   value = aws_instance.RB_EC2_Instance2.public_ip
# }