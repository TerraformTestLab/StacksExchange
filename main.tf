terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.5.0"
}

provider "aws" {
  region = var.aws_region
}

# Call the network module
module "network" {
  source              = "./modules/network"
  project_name        = var.project_name # Project name
  vpc_cidr_block      = var.vpc_cidr_block # CIDR block for the VPC
  public_subnet_cidrs = var.public_subnet_cidrs # CIDR blocks for the public subnets
}

# Call the database module
module "database" {
  source        = "./modules/database"
  project_name  = var.project_name # Project name
  db_subnet_ids = module.network.public_subnet_ids # Public subnet IDs
  vpc_id        = module.network.vpc_id # VPC ID
  db_username   = var.db_username # Username for the RDS instance
  db_password   = var.db_password # Password for the RDS instance
}

# Call the compute module
module "compute" {
  source                      = "./modules/compute"
  project_name                = var.project_name # Project name
  vpc_id                      = module.network.vpc_id # VPC ID
  public_subnet_ids           = module.network.public_subnet_ids # Public subnet IDs
  db_endpoint                 = module.database.db_endpoint # Name of the RDS instance endpoint
  key_name                    = var.key_name # Name of the SSH key pair
  allowed_inbound_cidr_blocks = var.allowed_inbound_cidr_blocks # Allow traffic from all IPs only on port 22
  allowed_vpc_cidr_blocks     = [module.network.vpc_cidr_block] # Allow traffic from inside the VPC only
}
