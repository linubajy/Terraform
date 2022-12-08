provider "aws" {
	region = "us-west-2"
	access_key = "demo"  
	secret_key = "demo"
}	

// Declare and define all vars defined in tfvars file 

module "instance" {
	source = "../Modules/ec2"
	env = var.env
}



