
# Creating a VPC

resource "aws_vpc" "RB_VPC" {
  cidr_block           = var.RB_VPC_CIDR
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "RB_VPC"
  }

  provisioner "local-exec" {
    command = "echo RB_VPC ID = ${self.id} >> metadata"
  }
}



