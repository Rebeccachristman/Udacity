# TODO: Define the output variable for the lambda function.
/* */
output "aws_iam_role_arn" { 
  value = aws_iam_role.lambda_role.arn
  description = "IAM Policy ARN for lambda function accessing CloudTrail"
  }
/**/

#  "aws_lambda_function" "test_lambda"
  output  test_lambda_arn { 
  value = aws_lambda_function.test_lambda.arn
  description = "lambda function arn"
  }
