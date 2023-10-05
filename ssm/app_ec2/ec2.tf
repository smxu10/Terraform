####    EC2   role

resource "aws_iam_role" "ssm_ec2_role" {
  name = "ssm_ec2_role"
  description = "IAM Role for EC2 use"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = [
            "ec2.amazonaws.com"
          ]
        }
      },
    ]
  })
}

# resource "aws_iam_role_policy_attachment" "ssm_ec2_policy" {
#   role       = aws_iam_role.ssm_ec2_role.name
#   policy_arn = data.terraform_remote_state.ssm-ec2-default-policy.arn
#   #policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedEC2InstanceDefaultPolicy"
# }

resource "aws_iam_role_policy_attachment" "ssm_ec2_policy" {
  for_each = toset([
    data.aws_iam_policy.ssm-ec2-default-policy.arn, 
    data.aws_iam_policy.s3-read-only-policy.arn,
    data.aws_iam_policy.cloudwatch-agent-service-policy.arn,
    data.aws_iam_policy.ssm-parameter-readonly-policy.arn
  ])

  role       = aws_iam_role.ssm_ec2_role.name
  policy_arn = each.value
}

resource "aws_iam_policy" "kms_access" {
  name        = "ec2-kms-access-policy"
  description = "ec2 access default aws/ssm"

  policy = <<EOT
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "kms:Decrypt",
                "kms:GenerateDataKey"
            ],
            "Resource": [
                "arn:aws:kms:us-east-1:841813377016:key/f0270a67-a5b4-4ebc-a874-e836e2d8b757"
            ]
        }
    ]
}
EOT
}

resource "aws_iam_role_policy_attachment" "kms_access" {
  role       = aws_iam_role.ssm_ec2_role.name
  policy_arn = aws_iam_policy.kms_access.arn  
}

resource "aws_iam_policy" "ec2-startstop" {
  name        = "ec2-startstop-policy"
  description = "start/stop ec2 instances"

  policy = <<EOT
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "ec2:StartInstances",
                "ec2:StopInstances",
                "ec2:DescribeInstances"
            ],
            "Effect": "Allow",
            "Resource": "*"
        }
    ]
}
EOT
}

resource "aws_iam_role_policy_attachment" "ec2-startstop" {
  role       = aws_iam_role.ssm_ec2_role.name
  policy_arn = aws_iam_policy.ec2-startstop.arn  
}

resource "aws_iam_instance_profile" "ec2_ssm_role_profile" {
  name = "ssm_ec2_profile"
  role = aws_iam_role.ssm_ec2_role.name

  depends_on = [
    aws_iam_role.ssm_ec2_role
  ]
}

## ami

data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-2.0.20230727.0-x86_64-gp2"]
  }
}

# create EC2
resource "aws_instance" "ec2_instance" {
  ami                  = data.aws_ami.amazon-linux-2.id
  instance_type        = var.instance_type
  iam_instance_profile = aws_iam_instance_profile.ec2_ssm_role_profile.id

  vpc_security_group_ids      = [data.terraform_remote_state.dhmc.outputs.ssm_sg_id, aws_security_group.jenkins.id]
  subnet_id                   = data.terraform_remote_state.dhmc.outputs.subnet_id

  tags = {
    Name = "ssm_jenkins"
    server_tag = "jenkins"
  }
}

