data "aws_ssm_parameter" "github-owner" {
  name = var.github_owner
}

data "aws_ssm_parameter" "github-ansible-repo" {
  name = var.github_ansible_repo
}

data "aws_ssm_parameter" "github-ansible-path" {
  name = var.github_ansible_path
}

data "aws_ssm_parameter" "github-ansible-jenkins-path" {
  name = var.github_ansible_jenkins_path
}

data "aws_ssm_parameter" "github-ansible-jenkins-adminpasswd" {
  name = var.github_ansible_jenkins_adminpasswd
}

data "aws_ssm_parameter" "github-ansible-jenkins-adminuser" {
  name = var.github_ansible_jenkins_adminuser
}

data "aws_ssm_parameter" "github-ansible-jenkins-privatekey" {
  name = var.github_ansible_jenkins_privatekey
}

data "aws_ssm_parameter" "github-ansible-jenkins-node1ip" {
  name = var.github_ansible_jenkins_node1ip
}
