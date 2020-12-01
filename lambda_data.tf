# This will zip up the lambda code so it is ready for upload
data "archive_file" "lambda_function" {
  type        = "zip"
  source_file = "./lambda_payload/saa_greet_lambda.py"
  output_path = "./lambda_payload/saa_greet_lambda.zip"
}
# This will run a lambda invocation so that the logs will have something to look at to prove it worked
data "aws_lambda_invocation" "test_lambda_function" {
  function_name = var.saa_lambda_function.name
  input = file("./lambda_payload/aws_json_test.json")
  depends_on = [aws_lambda_function.greetings_from_lambda, aws_cloudwatch_log_group.lambda_function_logs ]
}
