
# Attaching RDS

resource "aws_rds_cluster" "RB_AuroraCluster" {
  cluster_identifier        = "RB_AuroraCluster"
  availability_zones        = ["us-west-2a", "us-west-2b"]

  engine                    = "aurora-mysql"
  engine_version            = "5.7.mysql_aurora.2.11.1"
  
  database_name             = "RB_AuroraDB"
  master_username           = "RBNeueFische"
  master_password           = "RipalB1234"

  skip_final_snapshot       = true
  final_snapshot_identifier = "aurora-final-snapshot"

  db_subnet_group_name = aws_db_subnet_group.RB_DB_SubnetGroup.name

  vpc_security_group_ids = [aws_security_group.RB_DB_SecurityGroup_AllowSSH.id]

  tags = {
    Name = "RB_AuroraCluster"
  }
}

resource "aws_db_instance" "RB_SQL_DBInstance" {
  count = 2
  allocated_storage      = 20
  db_name                = "RB_AuroraDB"
  engine                 = "aurora-mysql"
  engine_version         = "5.7"
  instance_class         = "db.t3.micro"
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.RB_DB_SubnetGroup.name
  vpc_security_group_ids = [aws_security_group.RB_DB_SecurityGroup_AllowSSH.id]
}

resource "aws_db_subnet_group" "RB_DB_SubnetGroup" {
  name                   = "RB_DB_SubnetGroup"
  subnet_ids             = [aws_subnet.cidr_block_RB_Private_Subnet1.id, aws_subnet.RB_Private_Subnet2.id]

  tags                   = "RB_DB_SubnetGroup"
  }