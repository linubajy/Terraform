/* Dynamic blcok example */

provider "aws" {
	region = "us-west-2"
	skip_credentials_validation = true
	skip_requesting_account_id = true
	skip_metadata_api_check = true
	access_key = "mock"
	secret_key = "mock" 
	
}

variable "ports" {
	type = list
	default = [100,200]
}

resource "aws_security_group" "dynamic_sg" {
	name = "dynamic sg"
	dynamic "ingress" {
		for_each = var.ports
		content {
			from_port = ingress.value
			to_port = ingress.value
			protocol = "tcp"
			cidr_blocks = ["0.0.0.0/0"]
		}

	}

}
