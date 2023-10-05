### install cloudwatch agent 
resource "aws_ssm_association" "ssm-cloudwatchagent" {
  name = "AWS-ConfigureAWSPackage"
  parameters = {
  action = "Install"
  name = "AmazonCloudWatchAgent"
  }

  targets {
    key    = "tag:server_tag"
    values = [var.server_tag] 
  }
}