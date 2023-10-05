## Dynamic Host Management Configuration or DHMC
# define the role used by SSM


resource "aws_iam_role" "ssm_dhmc_role" {
  name = "ssm_dhmc_role"
  description = "IAM Role allowing dhmc access"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = [
            "ssm.amazonaws.com"
          ]
        }
      },
    ]
  })
}

resource "aws_iam_policy" "policy1" {
  name        = "ec2-startstop-policy"
  description = "start/stop ec2 instnce"

  policy = <<EOT
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:StartInstances",
        "ec2:StopInstances"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOT
}

# resource "aws_iam_role_policy_attachment" "attachment" {
#   role       = aws_iam_role.ssm_dhmc_role.name

#   for_each = toset([
#     aws_iam_policy.policy1.arn,
#     # data.aws_iam_policy.ssm-ec2-default-policy.arn, 
#     # data.aws_iam_policy.cloudwatch-agent-service-policy.arn
#   ])
#   policy_arn = each.value  

#   # depends_on = [
#   #   data.aws_iam_policy.ec2-startstop
#   # ]
# }


resource "aws_iam_role_policy_attachment" "attachment-0" {
  role       = aws_iam_role.ssm_dhmc_role.name
  policy_arn = aws_iam_policy.policy1.arn  
}

resource "aws_iam_role_policy_attachment" "attachment-1" {
  role       = aws_iam_role.ssm_dhmc_role.name
  policy_arn = data.aws_iam_policy.ssm-ec2-default-policy.arn  
}

resource "aws_iam_role_policy_attachment" "attachment-2" {
  role       = aws_iam_role.ssm_dhmc_role.name
  policy_arn = data.aws_iam_policy.cloudwatch-agent-service-policy.arn  
}


resource "aws_ssm_service_setting" "test_setting" {
  setting_id    = "arn:aws:ssm:${var.aws_region}:${data.aws_ssm_parameter.account-id.value}:servicesetting/ssm/managed-instance/default-ec2-instance-management-role"
  setting_value = aws_iam_role.ssm_dhmc_role.name
}

## security group of EC2 required by SSM

resource "aws_security_group" "ec2_ssm" {
  name = "ec2_ssm_sg"
  description = "Security Group for ec2s to access SSM"

  vpc_id = data.aws_ssm_parameter.vpc-id.value

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "unrestricted egress to the world"
  }
}

