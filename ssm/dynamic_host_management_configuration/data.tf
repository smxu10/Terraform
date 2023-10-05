data "aws_iam_policy" "ssm-ec2-default-policy" {
  arn = "arn:aws:iam::aws:policy/AmazonSSMManagedEC2InstanceDefaultPolicy"
}

data "aws_iam_policy" "s3-read-only-policy" {
  arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

data "aws_iam_policy" "cloudwatch-agent-service-policy" {
  arn = "arn:aws:iam::aws:policy/CloudWatchAgentAdminPolicy"
}

data "aws_iam_policy" "ec2-startstop" {
  arn = aws_iam_policy.policy1.arn
}

data "aws_ssm_parameter" "vpc-id" {
  name = var.vpc_id
}

data "aws_ssm_parameter" "subnet-id" {
  name = var.subnet_id
}

data "aws_ssm_parameter" "account-id" {
  name = var.account_id
}

