/* Create 3 SQS queues using count index for 3 different environments ie for 3 queue multiplied by 3 environments = 9 queues */

provider "aws" {
  region                      = "eu-west-1"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  access_key                  = "mock"
  secret_key                  = "mock"

}


variable "environment" {
  type    = list
  default = ["dev", "staging", "prod"]
}


resource "aws_sqs_queue" "terraform_queue_dev" {
  name                      = "${var.environment[0]}-${count.index + 1 }-queue"
  message_retention_seconds = 86400
  count                     = 3 
  tags = {
    Environment = var.environment[0]
  }
}


resource "aws_sqs_queue" "terraform_queue_staging" {
  name                      = "${var.environment[1]}-${count.index + 1 }-queue"
  message_retention_seconds = 86400
  count                     = 3
  tags = {
    Environment = var.environment[1]
  }
}

resource "aws_sqs_queue" "terraform_queue_prod" {
  name                      = "${var.environment[2]}-${count.index + 1 }-queue"
  message_retention_seconds = 86400
  count                     = 3
  tags = {
    Environment = var.environment[2]
  }
}
