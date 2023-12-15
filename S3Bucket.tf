
# #Provider profile and region in which all the resources will create

# provider "aws" {
#   profile = "default"
#   region  = "us-west-2"
# }

# #Resource to create s3 bucket

# resource "aws_s3_bucket" "RB_S3_Bucket"{
#   bucket = "RB_S3_Bucket"
#   acl    = "private"

#   tags = {
#     Name = "RB_S3_Bucket"
#     Environment = "Dev"
#   }

#   provisioner "local-exec" {
#     command = "echo RB_S3_Bucket ID=${self.id} >> metadata"
# }
# }

# # Associate the S3 bucket with the VPC.

# resource "aws_vpc_attachment" "S3_vpc_attachment" {
#   vpc_id = aws_vpc.RB_VPC.id # Replace with your VPC ID
#   subnet_ids   = [aws_subnet.RB_Private_Subnet1.id, aws_subnet.RB_Private_Subnet2.id]  # associsting subnet IDs
#   security_group_ids = aws.security_group_id.RB_VPC_SecurityGroup.id  # associating security group IDs

# # Associate the S3 bucket with the VPC
#   depends_on = [aws_s3_bucket.RB_S3_Bucket]
# }

# # Output the S3 bucket name
# output "S3_Bucket_Name" {
#   value = aws_s3_bucket.RB_S3_Bucket.bucket
# }