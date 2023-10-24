# Security Group Creation for vpc-code

resource "aws_security_group" "vpc_code_sg_allow_ssh_http"{
    name = "RB-VPC-SG"
    vpc_id = aws_vpc.vpc-code.id
}

# Ingress Security Port 22 (Inbound)
resource "aws_security_group_rule" "ssh_ingress_access"{
    from_port = 22
    protocol = "tcp"
    security_group_id = aws_security_group.vpc_code_sg_allow_ssh_http.id
    to_port = 22
    type = "ingress"
    cidr_blocks = ["10.0.0.0/16"]
}

# Ingress Security Port 80 (Inbound)
resource "aws_security_group_rule" "http_ingress_access"{
    from_port = 80
    protocol = "tcp"
    security_group_id = aws_security_group.vpc_code_sg_allow_ssh_http.id
    to_port = 80
    type = "ingress"
    cidr_blocks = ["10.0.0.0/16"]
}

# All egress/outbound Access

resource "aws_security_group_rule" "all_egress_access"{
    from_port = 0
    protocol = "-1"
    security_group_id = aws_security_group.vpc_code_sg_allow_ssh_http.id
    to_port = 0
    type = "egress"
    cidr_blocks = ["10.0.0.0/16"]
}
