variable "region" {
  default = "us-west-2"
}
variable "cidr_blocks" {
  default = "0.0.1.0/16"
}

provider "aws" {
  region  = "${var.region}"
}

resource "aws_subnet" "public_subnet"{
    cidr_block = var.public_cidr
    vpc_id = aws_vpc.provisionerVPC.id
    map_public_ip_on_launch = true
    availability_zone = data.aws_availability_zones.available.names[1]

    tags = {
        Name = "dev-public-subnet"
    }    
}
