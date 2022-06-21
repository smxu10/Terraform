locals {
  lambda_zip_locaiton = "outputs/ec2_desc_ips.zip"
}

data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "ec2_desc_ips.py"
  output_path = local.lambda_zip_locaiton
}

data "aws_iam_role" "lambda-com-role" {
  name = "lambda-com-role"
}

resource "aws_lambda_function" "ec2_desc_ips" {
  filename      = local.lambda_zip_locaiton
  function_name = "ec2_desc_ips"
  handler       = "ec2_desc_ips.lambda_handler"
  role          = data.aws_iam_role.lambda-com-role.arn
  timeout       = var.timeout

  source_code_hash = data.archive_file.lambda_zip.output_base64sha256

  runtime = "python3.9"
}