/* Example for Splat Expression for 3 users */

provider "aws" {
	region = "us-west-1"
	skip_credentials_validation = true
	skip_requesting_account_id = true
	skip_metadata_api_check = true
	access_key = "mock"
	secret_key = "mock" 
}


resource "aws_instance" "myinstance" {
	ami = "ami-test.${count.index}"
	instance_type = "t2.micro"
	count = 3

	
}

output "instances" {
	value =  aws_instance.myinstance[*].ami   // splat expession 
}