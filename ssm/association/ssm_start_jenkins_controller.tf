#### start ec2 instance 
resource "aws_ssm_association" "start-jenkins-controller" {
  association_name = "start-jenkins-controller"
  name = "AWS-StartEC2Instance"

  automation_target_parameter_name = "InstanceId"
  
  parameters = {
    AutomationAssumeRole = data.terraform_remote_state.dhmc.outputs.ssm-dhcm-role
  }
  
  targets {
    key    = "tag:server_tag"
    values = ["jenkins"]
  }

}
