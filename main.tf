terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.58.0"
    }
    datadog = {
      source  = "DataDog/datadog"
      version = "~> 3.30.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

provider "datadog" {
  api_key = var.datadog_api_key
  app_key = var.datadog_app_key
  api_url = "https://api.datadoghq.eu"
}

module "aws_infrastructure" {
  source         = "./modules/aws"
  aws_region     = var.aws_region
  vpc_id         = var.vpc_id
  subnet_ids     = var.subnet_ids
  key_name       = var.key_name
  instance_type  = var.instance_type
  k8s_node_count = var.k8s_node_count
}


module "datadog_monitors" {
   source          = "./modules/datadog"
   datadog_api_key = var.datadog_api_key
   datadog_app_key = var.datadog_app_key
 }
