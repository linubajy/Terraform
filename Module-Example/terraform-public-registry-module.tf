terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "<4.49.0"       
    }
  }
}

provider "aws" {
	region = "us-west-2"
	access_key =  "demo"
  secret_key = "demo"
}

module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.3.0"             /* Public registry module version */
}