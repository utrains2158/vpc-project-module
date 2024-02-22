# configure aws provider
provider "aws" {
  region  = var.aws_region
  profile = "default"

}

# create VPC
module "vpc-project-samka" {
  source                       = "../vpc_project"
  aws_region                   = var.aws_region
  project_name                 = var.project_name
  enviromnent                  = var.enviromnent
  vpc_cidr                     = var.vpc_cidr
  public_subnet_az1_cidr       = var.public_subnet_az1_cidr
  public_subnet_az2_cidr       = var.public_subnet_az2_cidr
  private_app_subnet_az1_cidr  = var.private_app_subnet_az1_cidr
  private_app_subnet_az2_cidr  = var.private_app_subnet_az2_cidr
  private_data_subnet_az1_cidr = var.private_data_subnet_az1_cidr
  private_data_subnet_az2_cidr = var.private_data_subnet_az2_cidr
}