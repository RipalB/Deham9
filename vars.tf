variable "region" {
  default = "us-west-2"
}

provider "aws" {
  region  = "${var.region}"
}

variable "vpc_cidr"{
    default = "10.0.1.0/24"
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
