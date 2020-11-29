data "archive_file" "lambda_function" {
  type        = "zip"
  source_file = "saa_greet_lambda.py"
  output_path = "saa_greet_lambda.zip"
}
