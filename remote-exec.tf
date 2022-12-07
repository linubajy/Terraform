
provider "aws" {
	region = "us-east-1"
	access_key = "demo"
	secret_key = "demo"
}

resource "aws_security_group" "remote_exec_sg" {
	name = "SG-1"
	
	ingress {
		from_port = 80
		to_port = 80
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

	ingress {
		from_port = 443
		to_port = 443
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

	ingress {
		from_port = 22
		to_port = 22
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

	egress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}

}


resource "aws_instance" "myec2" {
	ami = "ami-0574da719dca65348"
	instance_type = "t2.micro"
	key_name = "ubuntu-terraform"
	security_groups = [aws_security_group.remote_exec_sg.name]

	connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = file("./ubuntu-terraform.pem")
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
    	"sudo apt-get install apache2 -y",
    	"sudo systemctl start apache2",
    	]
  	}
}

output "public_ip" {
	value = aws_instance.myec2.public_ip
}