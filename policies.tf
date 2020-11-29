resource "aws_iam_role" "lambda_iam_role" {
  name = "lambda_iam_role"

  assume_role_policy = file("./aws_policies/lambda_iam_role.json")
  tags               = var.udc_default_tags
}

resource "aws_iam_policy" "lambda_logging" {
  name        = "lambda_logging"
  path        = "/"
  description = "IAM policy for logging from a lambda"

  policy = file("./aws_policies/cloudwatch_lambda_logging.json")
}
