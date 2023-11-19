# Creating Public Subnets

# Public Subnet-1

resource "aws_subnet" "RB_Public_Subnet1" {
  cidr_block              = var.cidr_block_RB_Public_Subnet1 #256 IPs
  vpc_id                  = aws_vpc.RB_VPC.id
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.RB_VPC_AZS.names[0]
  tags = {
    Name = "RB_Public_Subnet1"
  }

  provisioner "local-exec" {
    command = "echo RB_Public_Subnet1 = ${self.id} >> metadata"
  }
}

# #Public Subnet-2

resource "aws_subnet" "RB_Public_Subnet2" {
  cidr_block              = var.cidr_block_RB_Public_Subnet2
  vpc_id                  = aws_vpc.RB_VPC.id
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.RB_VPC_AZS.names[1]

  tags = {
    Name = "RB_Public_Subnet2"
  }

  provisioner "local-exec" {
    command = "echo RB_Public_Subnet2 = ${self.id} >> metadata"
  }
}

# # Creating Private Subnets

# Private Subnet-1
resource "aws_subnet" "RB_Private_Subnet1" {
  cidr_block              = var.cidr_block_RB_Private_Subnet1
  vpc_id                  = aws_vpc.RB_VPC.id
  map_public_ip_on_launch = false
  availability_zone       = data.aws_availability_zones.RB_VPC_AZS.names[0]

  tags = {
    Name = "RB_Private_Subnet1"
  }

  provisioner "local-exec" {
    command = "echo RB_Private_Subnet1 = ${self.id} >> metadata"
  }
}


# Private Subnet-2

resource "aws_subnet" "RB_Private_Subnet2" {
  cidr_block              = var.cidr_block_RB_Private_Subnet2
  vpc_id                  = aws_vpc.RB_VPC.id
  map_public_ip_on_launch = false
  availability_zone       = data.aws_availability_zones.RB_VPC_AZS.names[1]

  tags = {
    Name = "RB_Private_Subnet2"
  }

  provisioner "local-exec" {
    command = "echo RB_Private_Subnet2 = ${self.id} >> metadata"
  }
}