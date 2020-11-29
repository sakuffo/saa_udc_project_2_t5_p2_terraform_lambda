# TODO: Define the variable for aws_region
variable "aws-primary" {
  default = "us-east-1"
}

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
