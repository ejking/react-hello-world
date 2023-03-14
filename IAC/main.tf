terraform {
  cloud {
    organization = "healthfirst"
    workspaces {
      name = "LAMP-CI-CD"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.48.0"
    }
  }

  required_version = ">= 1.3.0"
}

locals {
  default_tags = {
    "Environment" = var.environment
    "Name" = ""
    "Service Role" = ""
  }
}

provider "aws" {
  region = "us-east-1"
#  default_tags {
#    tags = merge(local.cost_center, local.default_tags)
#  }
}

module "ec2" {
  source  = "app.terraform.io/healthfirst/hf-ec2/aws"
  version = "1.1.0"
  os_platform   = var.os_platform
  environment   = var.environment
  subnet_type   = var.subnet_type
  cost_center   = var.cost_center
  user_data     = file(var.user_data_path)
  instance_name = var.instance_name
  instance_size = var.ec2_instance_size
  ami_filters   = var.ami_filters
  account_vars  = var.account_vars
  cost_centers  = var.cost_centers
}
    
module "rds" {
  source  = "app.terraform.io/healthfirst/hf-rds/aws"
  version = "1.3.0"
  
  cluster_name            = var.cluster_name
  database_name           = var.database_name
  engine                  = var.engine
  instance_size           = var.rds_instance_size
  environment             = var.environment
  subnet_type             = var.subnet_type
  skip_final_snapshot     = true
  cost_center             = var.cost_center
  account_vars            = var.account_vars
  cost_centers            = var.cost_centers
}
