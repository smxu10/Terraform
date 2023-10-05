#### stop ec2 instance 
resource "aws_ssm_association" "stop-jenkins-agent" {
  association_name = "stop-jenkins-agent"
  
  name = "AWS-StopEC2Instance"

  schedule_expression = "cron(0 23 ? * * *)"
 
  automation_target_parameter_name = "InstanceId"
  
  parameters = {
    InstanceId = "use_tag_instead"
    AutomationAssumeRole = data.terraform_remote_state.dhmc.outputs.ssm-dhcm-role
  }
  
  targets {
    key    = "tag:server_tag"
    values = [var.jenkins_agent_tag]
  }

  output_location {
    s3_bucket_name = "ssm-output-sean"
    s3_region = "us-east-1"
  }  
}
