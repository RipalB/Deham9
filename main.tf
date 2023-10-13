# resource "aws_instance" "ec2_instance" {
#   ami=var.AMIS[var.AWS_REGION] 
#   instance_type = "t3.micro"
#   associate_public_ip_address = true
#   tags = {
#     Name = "Terraform_test_ec2"
#   }
# }
# output public_ip{
#   value=aws_instance.ec2_instance.public_ip
# }
# resource "aws_instance" "webserver" {
#   for_each = var.webservers
#     ami=var.AMIS[var.AWS_REGION] 
#     instance_type = "t2.micro"
#     associate_public_ip_address = true
#     tags = {
#       Name = each.value["name"]
#     }
# }
data "aws_availability_zones" "available"{}
# VPC Creation using CIDR block available in vars.tf
resource "aws_vpc" "provisionerVPC"{
    cidr_block = var.vpc_cidr
    enable_dns_hostnames=true
    enable_dns_support = true
    tags = {
        Name = "rgb-vpc"
    }
}
