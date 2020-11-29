terraform {
  required_version = ">= 0.13"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0.0"
    }
  }
}

provider "aws" {
  region = var.aws-primary
}

resource "aws_lambda_function" "greetings_from_lambda" {
  filename      = data.archive_file.lambda_function.output_path
  function_name = var.saa_lambda_function.name
  role          = aws_iam_role.lambda_iam_role.arn
  handler       = "${var.saa_lambda_function.file}.lambda_handler"
  runtime       = "python3.8"

  environment {
    variables = {
      "authour" = "Stephen Akuffo"
    }
  }

  tags = var.udc_default_tags

  depends_on = [aws_cloudwatch_log_group.lambda_function_logs]
}


