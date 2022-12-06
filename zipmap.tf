/* Zipman Example */

// create 4 iam users and display the arn with username

provider "aws" {
	region = "eu-west-1"
	skip_credentials_validation = true
	skip_requesting_account_id = true
	skip_metadata_api_check = true
	access_key = "mock"
	secret_key = "mock" 
} 

resource "aws_iam_user" "lb" {
  name = "iam_user-${count.index + 1}"
  path = "/system/"

  count =3 

}

output "arns" {
	value = aws_iam_user.lb[*].arn
}

output "username_with_arn" {
	value  = zipmap (aws_iam_user.lb[*].name , aws_iam_user.lb[*].arn )
}