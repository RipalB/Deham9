# # creating Output file for Infrastructure Resources

output "VPC_id" {
  value = aws_vpc.RB_VPC.id #VPC
}

output "aws_internet_gateway"{
     value = aws_internet_gateway.RB_Internet_Gateway.id  #Internet gateway
}

output "RB_Public_Subnet1_ids" {
  value = aws_subnet.RB_Public_Subnet1.id     #Public Subnet-1
}

output "RB_Public_Subnet2_ids" {
  value = aws_subnet.RB_Public_Subnet2.id     #Public Subnet-2
}

output "RB_Private_Subnet1_ids" {
  value = aws_subnet.RB_Private_Subnet1.id    #Private Subnet-1
}

output "RB_Private_Subnet2_ids" {
  value = aws_subnet.RB_Private_Subnet2.id    #Private Subnet-2
}

output "RB_VPC_SecurityGroup"{
    value = aws_security_group.RB_VPC_SecurityGroup.id       #VPC Security Group
}

output "aws_ami" {
  value = data.aws_ami.RB_latest_amazon_linux.id     #Instance AMI
}
