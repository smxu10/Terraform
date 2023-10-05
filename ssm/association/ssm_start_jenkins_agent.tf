#### start ec2 instance 
resource "aws_ssm_association" "start-jenkins-agent" {
  association_name = "start-jenkins-agent"  
  name = "AWS-StartEC2Instance"

  automation_target_parameter_name = "InstanceId"
  
  parameters = {
    AutomationAssumeRole = data.terraform_remote_state.dhmc.outputs.ssm-dhcm-role
  
  }
  
  targets {
    key    = "tag:server_tag"
    values = ["jenkins_agent"]
  }

}
