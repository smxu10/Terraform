#### start cloudwatch agent 
resource "aws_ssm_association" "start-cloudwatchagent" {
  name = "AmazonCloudWatch-ManageAgent"

  parameters = {
    action = "start"
    mode = "ec2"
    optionalConfigurationLocation = "AmazonCloudWatch-agent-config-httpd"
    optionalConfigurationSource = "ssm"
    optionalRestart = "yes"
  }
 
  targets {
    key    = "tag:server_tag"
    values = [var.server_tag] 
  }

  depends_on = [
    aws_ssm_association.ssm-cloudwatchagent
  ]
}

