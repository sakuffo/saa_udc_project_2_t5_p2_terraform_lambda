
resource "aws_cloudwatch_log_group" "lambda_function_logs" {
  name              = "/aws/lambda/${var.saa_lambda_function.name}"
  retention_in_days = 14
  tags              = var.udc_default_tags
}


resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.lambda_iam_role.name
  policy_arn = aws_iam_policy.lambda_logging.arn
}