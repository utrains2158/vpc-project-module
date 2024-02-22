# store the terraform state file in s3 and lock with dynamodb
terraform {
  backend "s3" {
    bucket  = "samka-source-bucket"
    key     = "vpc_project-prod"
    region  = "us-east-1"
    profile = "default"
    ##dynamodb_table = 
  }
}