data "aws_iam_policy" "ssm-ec2-default-policy" {
  arn = "arn:aws:iam::aws:policy/AmazonSSMManagedEC2InstanceDefaultPolicy"
}

data "aws_iam_policy" "s3-read-only-policy" {
  arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

data "aws_iam_policy" "cloudwatch-agent-service-policy" {
  arn = "arn:aws:iam::aws:policy/CloudWatchAgentAdminPolicy"
}

data "aws_iam_policy" "ssm-parameter-readonly-policy" {
  arn = "arn:aws:iam::aws:policy/AmazonSSMReadOnlyAccess"
}