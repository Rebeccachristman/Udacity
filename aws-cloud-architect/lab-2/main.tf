
resource "aws_iam_role" "lambda_role" {
  name = "lambda_role"
  assume_role_policy = var.lambda-assume-policy
}  



resource "aws_iam_role_policy" "lambda_policy" {
  name="lambda_policy"
  role = "${aws_iam_role.lambda_role.id}"
  policy = var.lambda-policy
}



resource "aws_lambda_function" "test_lambda" {
  # If the file is not in the current working directory you will need to include a 
  # path.module in the filename.
  #filename      = "lambda_function_payload.zip"
  #function_name = "lambda_function_name"
  
  filename      = "greet_lambda.zip"
  function_name = "greet_lambda"

  role          = aws_iam_role.lambda_role.arn
  handler       = "greet_lambda.lambda_handler"

  # The filebase64sha256() function is available in Terraform 0.11.12 and later
  # For Terraform 0.11.11 and earlier, use the base64sha256() function and the file() function:
  # source_code_hash = "${base64sha256(file("lambda_function_payload.zip"))}"
  source_code_hash = filebase64sha256("greet_lambda.zip")

  runtime = "python3.8"

  environment {
    variables = {
      greeting = "Howdy pardner!"
    }
  }

}
