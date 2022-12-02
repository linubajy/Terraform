/* exercise to select ami based on region entered by the user and display to user */

provider "aws" {
	region = var.region
	skip_credentials_validation = true
	skip_requesting_account_id = true
	skip_metadata_api_check = true
	access_key = "mock"
	secret_key = "mock" 
}

resource "aws_instance" "myinstance" {
	ami = var.ami_mapping[var.region]
	instance_type = "t2.micro"
}

variable "ami_mapping" {
	type = map
	default = {
		"us-west-1" = "ami-001"
		"us-west-2" = "ami-002"
	} 
}

variable region {}

output "ami_name" {
	value = aws_instance.myinstance.ami
}