/* Zipman Example */
/* Credentials have been given a dummy value for security purpose. To run the code */ 

provider "aws" {
	region = "us-east-1" 
	access_key = "demo"
	secret_key = "demo"
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



