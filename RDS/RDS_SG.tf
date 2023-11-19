

resource "aws_security_group" "RB_DB_SecurityGroup_AllowSSH" {
  name        = "RB_DB_SecurityGroup_AllowSSH"
  description = "Allow SSH traffic"
  vpc_id      = aws_vpc.RB_VPC.id

resource "aws_security_group" "RB_DB_SecurityGroup_AllowSSH"{
        vpc_id                      = aws_vpc.RB_VPC.id
        tags                        = {
        Name                        = "RB_SQLDB_SecurityGroup"
        }
        provisioner "local-exec"{
        command                     = "echo Security_Group_MYSQL = ${self.id} >> metadata"
        }  
}