#### stop cloudwatch agent 
resource "aws_ssm_association" "stop-cloudwatchagent" {
  name = "AmazonCloudWatch-ManageAgent"

  parameters = {
    action = "stop"
    mode = "ec2"
  }

  targets {
    key    = "tag:server_tag"
    values = [var.server_tag] 
  }

  depends_on = [
    aws_ssm_association.ssm-cloudwatchagent
  ]
}