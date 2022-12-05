/* Create tags for resources using locals block */
provider "aws" {
  region                      = "eu-west-1"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  access_key                  = "mock"
  secret_key                  = "mock"

}

locals {
  
  frontend_tags = {
    name = "DevOps"
    service =  "Frontend"
  }

  backend_tags = {
    name = "DevOps"
    service =  "Backend"
  }

}


resource "aws_instance" "myec2" {
  ami = ""
  instance_type = "t2.micro"
  tags = local.frontend_tags
}

resource "aws_db_instance" "RDS" {
  allocated_storage    = 10
  db_name              = "App-DB"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  tags = local.backend_tags
}