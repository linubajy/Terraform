//"public_ip" is the keyword

output "public_ip" {
	value = aws_instance.myec2.public_ip
	description = "Staging instance public IP"
}