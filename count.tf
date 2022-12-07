/*Create 3 alarms at 3 different environments */

provider "aws" {
	region = "eu-west-1"
	skip_credentials_validation = true
	skip_requesting_account_id = true
	skip_metadata_api_check = true
	access_key = "mock"
	secret_key = "mock" 
} 

variable "environment" {
	type = list
	default = ["dev","staging","prod"]

}




resource "aws_cloudwatch_metric_alarm" "cwalarm" {
  alarm_name                = "${var.environment[count.index]}-Environment-Alarm"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  metric_name               = "CPUUtilization"
  period                    = "120"
  statistic                 = "Average"
  threshold                 = "80"
  alarm_description         = "This metric monitors ec2 cpu utilization"
  count =  3
}

