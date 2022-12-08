
output "Env" {
	value = var.env
}

output "staging-instance-public-ip" {
	value = module.instance.public_ip
	description = "Public IP of Staging instance"
}