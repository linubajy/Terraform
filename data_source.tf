/* Example for data source block */
/* Credentials have been given a dummy value for security purpose. To run the code ,we require credentials of the AWS Account to fetch data */ 

provider "aws" {
	region = "us-east-1"
	access_key = "mock"
	secret_key = "mock"
	
	
}

data "aws_ami" "ami_virginia" {
	most_recent = true
	owners = ["amazon"]

	filter {
		name = "name"
		values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
	}
}

resource "aws_instance" "myec2" {
	ami = data.aws_ami.ami_virginia.id
	instance_type = "t2.micro"
}

