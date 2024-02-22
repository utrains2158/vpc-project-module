# store the terraform state file in s3 and lock with dynamodb
terraform {
  backend "s3" {
    bucket  = "${var.project_name}-${var.enviromnent}-bucket"
    key     = "vpc_project"
    region  = var.aws_region
    profile = "default"
    #dynamodb_table = 
  }
}