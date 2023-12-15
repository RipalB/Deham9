

# data "aws_ami" "amzLinux" {
#         most_recent                 = true
#         owners                      = ["amazon"]

#     filter {
#         name                        = "name"
#         values                      = ["al2023-ami-2023*x86_64"]
#         }
# }
#  locals {
#         DB                          = "RB_AuroraDB"
#         User                        = "RBNeueFische"
#         PW                          = "RipalB1234"
#        # rds_cluster_endpoint        = aws_rds_cluster.rb_auroracluster.endpoint  #Verify this
# }
# #Launch Template
# resource "aws_launch_template" "RB_LaunchTemplate" {
#   name                              = "WebserverLaunchTemplate"
#   image_id                          = "ami-0d2017e886fc2c0ab"
#   instance_type                     = "t3.micro"
#   vpc_security_group_ids            = [aws_security_group.RB_VPC_SecurityGroup.id]
# #   user_data                         = base64encode(templatefile("newuserdata.sh",{
# #         DB   = local.DB
# #         User = local.User
# #         PW   = local.PW
# #         host = local.host
# #     })) 

#   #IAM profile
#   iam_instance_profile {
#         name                        = "RB_InstanceRole"
#    }     
#   tag_specifications {
#         resource_type               = "RB_Instance"
#         tags                        = {
#             Name                    = "RB_MySQLServer"
#    }
#   }
# }
# #Autoscaling Group
# resource "aws_autoscaling_group" "RB_AutoScalingGroup" {
#   name                              = "RB_AutoScalingGroup"
#   max_size                          = 4
#   min_size                          = 2
#   desired_capacity                  = 2


#  #need to confirm as we are not using NATGateway in our Project

#   #changed to public subnets while NATGateway is turned off 
#   vpc_zone_identifier               = [aws_subnet.RB_Public_Subnet1.id, aws_subnet.RB_Public_Subnet2.id]
#   target_group_arns                 = [aws_lb_target_group.rb-lb-targetgroup.arn]
#   health_check_type                 = "ELB"
#   health_check_grace_period         = 300
#   launch_template {
#     id                              = aws_launch_template.RB_LaunchTemplate.id
#     version                         = "$Latest"
#   }
# }
# #Autoscaling policy
# resource "aws_autoscaling_policy" "RB_CPUPolicy" {
#   name                              = "RB_CPUPolicy"
#   policy_type                       = "TargetTrackingScaling"
#   target_tracking_configuration {
#     predefined_metric_specification {
#       predefined_metric_type        = "ASGAverageCPUUtilization"
#     }
#       target_value                  = 75.0
#   }
#   autoscaling_group_name            = aws_autoscaling_group.RB_AutoScalingGroup.name
# }