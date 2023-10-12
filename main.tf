# resource "aws_instance" "ec2_instance" {
#   ami=var.AMIS[var.AWS_REGION] 
#   instance_type = "t2.micro"
#   associate_public_ip_address = true

#   tags = {
#     Name = "Terraform_test_ec2"
#   }
# }