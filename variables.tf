# AWS Region to be used
variable "aws-primary" {
  default = "us-west-2"
}
# Lambda function info
variable "saa_lambda_function" {
  type = object({
    name = string
    file = string
  })
  default = {
    name = "saa_greetings_from_lambda"
    file = "saa_greet_lambda"
  }
}

variable "udc_default_tags" {
  type = map
  default = {
    "courseWork" : "true",
    "entity" : "udacity",
    "program" : "aws-architect"
  }
  description = "Tags to mark all resources for the course"
}
