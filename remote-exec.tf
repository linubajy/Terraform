
provider "aws" {
	region = "us-east-1"
	access_key = "AKIA57L3YLDEJFUZPHNU"
	secret_key = "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"
}

resource "aws_instance" "myec2" {
	ami = "ami-0574da719dca65348"
	instance_type = "t2.micro"
	key_name = "ubuntu-terraform"

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