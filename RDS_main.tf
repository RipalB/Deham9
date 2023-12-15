
# # Attaching RDS

# resource "aws_rds_cluster" "rb_auroracluster" {
#   cluster_identifier = "rb-auroracluster"
#   engine             = "aurora-mysql"
#   engine_version     = "5.7.mysql_aurora.2.11.1"

#   database_name   = "rb_auroradb"
#   master_username = "rbneuefische"
#   master_password = "ripalb1234"

#   skip_final_snapshot       = true
#   final_snapshot_identifier = "aurora-final-snapshot"

#   db_subnet_group_name   = aws_db_subnet_group.RB_DB_SubnetGroup.name
#   vpc_security_group_ids = [aws_security_group.RB_DB_SecurityGroup_AllowSSH.id]

#   tags = {
#     Name = "RB_AuroraCluster"
#   }
# }

# resource "aws_rds_cluster_instance" "rb-dbinstance" {
#   count              = 2
#   identifier         = "clusterinstance-${count.index}"
#   cluster_identifier = aws_rds_cluster.rb_auroracluster.id
#   instance_class     = "db.t3.small"
#   engine             = "aurora-mysql"
#   availability_zone  = "us-west-2${count.index == 0 ? "a" : "b"}"

#   tags = {
#     Name = "rb-db-instance${count.index + 1}"
#   }
# }

# resource "aws_db_subnet_group" "RB_DB_SubnetGroup" {
#   name       = "rb_db_subnetgroup"
#   subnet_ids = [aws_subnet.RB_Private_Subnet1.id, aws_subnet.RB_Private_Subnet2.id]

#   tags = {
#     Name = "RB_DB_SubnetGroup"
#   }
# }