# This will create a iam role
resource "aws_iam_role" "lambda_iam_role" {
  name = "lambda_iam_role"

  assume_role_policy = file("./aws_policies/lambda_iam_role.json")
  tags               = var.udc_default_tags
}

# This will create an iam policy meant for th logging lambda files
resource "aws_iam_policy" "lambda_logging" {
  name        = "lambda_logging"
  path        = "/"
  description = "IAM policy for logging from a lambda"

  policy = file("./aws_policies/cloudwatch_lambda_logging.json")
}

# This will attach and iam policy to the iam role
resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.lambda_iam_role.name
  policy_arn = aws_iam_policy.lambda_logging.arn
}

#  This will create a cloudwatch log group to allow the lambda logs to be streamed into
resource "aws_cloudwatch_log_group" "lambda_function_logs" {
  name              = "/aws/lambda/${var.saa_lambda_function.name}"
  retention_in_days = 14
  tags              = var.udc_default_tags
}
