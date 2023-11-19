
#Adding Load Balancer

resource "aws_lb" "RB_loadBalancer" {
  name                              = "RB_Loadbalancer"
  internal                          = false
  load_balancer_type                = "application"
  security_groups                   = [aws_security_group.RB_VPC_SecurityGroup.id]
  subnets                           = [aws_subnet.RB_Public_Subnet1.id, aws_subnet.RB-Public-Subnet2.id]
  enable_deletion_protection        = false
    tags = {
        Environment                 = "production"
  }
}

#Adding Target Group

resource "aws_lb_target_group" "RB_LB_TargetGroup" {
  name                              = "RB_LB_TG"
  port                              = 80
  protocol                          = "HTTP"
  vpc_id                            = aws_vpc.RB_VPC.id
}

#Adding Listener

resource "aws_lb_listener" "cpstn-listener" {
  load_balancer_arn                 = aws_lb.RB_loadBalancer.arn
  port                              = 80
  protocol                          = "HTTP"
  default_action {
    type                            = "forward"
    target_group_arn                = aws_lb_target_group.RB_LB_TargetGroup.arn
  }
}