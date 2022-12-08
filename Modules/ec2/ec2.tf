 

resource "aws_instance" "myec2" {
	ami = "ami-094125af156557ca2"
	instance_type = "t2.micro"
	

	tags = {
		name = "Environment"
		value = var.env
	}
	
}


