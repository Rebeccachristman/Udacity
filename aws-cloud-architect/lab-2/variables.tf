
# TODO: Define the variable for aws_region


variable "awsprops" {
    type = map
    default = {
    region = "us-east-1"
    vpc = "vpc-0c65ce14eff8134c3"
  }
}

# From AWS Policy Generator, allow lambda function to access CloudTrail logs
variable "lambda-policy" {
    type = string
    default = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Action": "logs:*",
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

#       "Resource": "arn:aws:lambda:*:function:*",
#      "Resource": "*"


/**/
# trust policy
variable "lambda-assume-policy" {
   type = string
   default = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}
/**/


 


