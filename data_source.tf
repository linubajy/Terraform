provider "aws" {
	region = "us-west-2"
	skip_credentials_validation = true
	skip_requesting_account_id = true
	skip_metadata_api_check = true
	access_key = "mock"
	secret_key = "mock" 
	
}

data "aws_ami" "ami_oregon" {
	most_recent = true
	owners = ["amazon"]

	filter {
		name = "name"
		values = ["ubuntu-20.04*"]
	}
}

resource "aws_instance" "myec2" {
	ami = data.aws_ami.ami_oregon.id
	instance_type = "t2.micro"
}