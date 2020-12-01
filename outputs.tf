output "cloudwatch_arn" {
  value = aws_cloudwatch_log_group.lambda_function_logs.arn
}

output "lambda_function_arn" {
  value = aws_lambda_function.greetings_from_lambda.arn
}

