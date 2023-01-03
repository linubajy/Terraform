
provider "aws" {
	region = "us-west-2"
	access_key = "mock" 
	secret_key = "mock"
}

resource "aws_instance" "myec2" {
	ami = "ami-094125af156557ca2"
	instance_type = "t2.micro"
	tags = {
	  name = "Linu's First Instance"
	}
}

output "ami" {
	value = aws_instance.myec2.ami
}