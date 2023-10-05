resource "aws_ssm_association" "install-jenkins-ansible" {
  name = "AWS-ApplyAnsiblePlaybooks"

  association_name = "install-jenkins-ansible"
 
  targets {
    key    = "tag:server_tag"
    values = ["jenkins"]
  }
  
  parameters = {
        SourceType = "GitHub",
        # SourceInfo = "{ \"owner\":\"${var.github_owner}\",\"repository\":\"${var.github_repo}\",\"path\":\"${var.github_path}\",\"getOptions\":\"branch:master\" }"
        SourceInfo = "{ \"owner\":\"${data.aws_ssm_parameter.github-owner.value}\",\"repository\":\"${data.aws_ssm_parameter.github-ansible-repo.value}\",\"path\":\"${data.aws_ssm_parameter.github-ansible-jenkins-path.value}\", \"getOptions\":\"branch:master\" }"
        InstallDependencies = "True"
        PlaybookFile = var.github_jenkins_playbook 
        #ExtraVariables = "SSM=True fruit=apple adminuser=${data.aws_ssm_parameter.github-ansible-jenkins-adminuser.value} adminpasswd=${data.aws_ssm_parameter.github-ansible-jenkins-adminpasswd.value}"
        ExtraVariables = "SSM=True adminpasswd=${data.aws_ssm_parameter.github-ansible-jenkins-adminpasswd.value} adminuser=${data.aws_ssm_parameter.github-ansible-jenkins-adminuser.value} node1ip=${data.aws_ssm_parameter.github-ansible-jenkins-node1ip.value} privatekey='${data.aws_ssm_parameter.github-ansible-jenkins-privatekey.value}'"
        Check = "False"
        Verbose = "-v"
  }
}
                                                                                                                                
                                  