
# # EC-2 Configuration in VPC

# Instance Configuration
resource "aws_instance" "RB_VPC_EC2"{
    data "aws_ami" "RB_latest_amazon_linux"{
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]  # Filter pattern for Amazon Linux 2 AMIs
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]  # Specify the owner of the AMI
}

    provisioner "local-exec"{
        command = "echo Instance Type=${self.instance_type},Instance ID=${self.id},Public DNS=${self.public_dns},AMI ID=${self.ami} >> metadata"
    }
}
