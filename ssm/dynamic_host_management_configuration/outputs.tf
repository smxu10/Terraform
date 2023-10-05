output "ssm_sg_id" {
  value = aws_security_group.ec2_ssm.id
}

output "ssm-ec2-default-policy" {
  value = data.aws_iam_policy.ssm-ec2-default-policy.arn
}

output "ssm-dhcm-role" {
  value = aws_iam_role.ssm_dhmc_role.arn
}

output "vpc_id"{
  value = data.aws_ssm_parameter.vpc-id.value
  sensitive = true
}

output "subnet_id"{
  value = data.aws_ssm_parameter.subnet-id.value
  sensitive = true   
}

output "account_id"{
  value = data.aws_ssm_parameter.account-id.value
  sensitive = true
}