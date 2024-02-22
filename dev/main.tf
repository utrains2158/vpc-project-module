# configure aws provider
provider "aws" {
  region  = var.aws_region
  profile = "default"

}

# create VPC
module "vpc-project-samka" {
  source                       = "../vpc_module_project"
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

# create natgateway(the values are from vpc-module output)
module "natgateway-project-samka" {
  source                     = "../vpc_module_project/nat-gateway"
  public_subnet_az1_id       = module.vpc-project-samka.public_subnet_az1_id
  public_subnet_az2_id       = module.vpc-project-samka.public_subnet_az2_id
  internet-gateway           = module.vpc-project-samka.internet-gateway
  vpc_id                     = module.vpc-project-samka.vpc_id
  private_app_subnet_az1_id  = module.vpc-project-samka.private_app_subnet_az1_id
  private_data_subnet_az1_id = module.vpc-project-samka.private_data_subnet_az1_id
  private_app_subnet_az2_id  = module.vpc-project-samka.private_app_subnet_az2_id
  private_data_subnet_az2_id = module.vpc-project-samka.private_data_subnet_az2_id
}