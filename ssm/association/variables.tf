variable "ssm_association_s3_name" {
  type        = string
  default     = "s3-ansible-tf"
}

variable "ssm_association_github_name" {
  type        = string
  default     = "github-ansible-tf"
}

variable "aws_managed_ssm_document" {
  type        = string
  default     = "AWS-ApplyAnsiblePlaybooks"
}

variable "bucket" {
  type        = string
  default     = "ansible-pb1"
}

variable "instance_tag" {
  type        = map
  default = {
    "Name" = "ssm_jenkins"
  }
}

variable "schedule" {
  type        = string
  default     = "cron(0 2 ? * THU#4 *)"
}

variable "bucket_prefix_1" {
  description = "S3 bucket prefix or consider as folder path"
  type        = string
  default     = "installhttpd"
}

variable "bucket_prefix_2" {
  description = "S3 bucket prefix or consider as folder path"
  type        = string
  default     = "createdir"
}

variable "s3_playbook_1" {
  type        = string
  default     = "install-httpd_via-s3.yml"     
}

variable "s3_playbook" {
  type        = string
  default     = "playbook.yml"     
}

variable "github_playbook" {
  type        = string
  default     = "install-httpd.yml"     
  # default     = "playbook.yml"     
}

variable "github_jenkins_playbook" {
  type        = string
  # default     = "testplaybook.yml"     
  default     = "install_jenkins.yml"     
}

variable "github_owner" {
  type        = string
  default     = "/github/owner"     
}

variable "github_ansible_path" {
  type        = string
  default     = "/github/ansible/path"      
}

variable "github_ansible_repo" {
  type        = string
  default     = "/github/ansible/repo"     
}

variable "github_ansible_jenkins_path" {
  type        = string
  default     = "/github/ansible/jenkins/path"      
}
variable "server_tag" {
  type        = string
  default     = "jenkins"      
}

variable "jenkins_agent_tag" {
  type        = string
  default     = "jenkins_agent"      
}

variable "github_ansible_jenkins_adminpasswd" {
  type        = string
  default     = "/github/ansible/jenkins/adminpasswd"      
}

variable "github_ansible_jenkins_adminuser" {
  type        = string
  default     = "/github/ansible/jenkins/adminuser"      
}

variable "github_ansible_jenkins_node1ip" {
  type        = string
  default     = "/github/ansible/jenkins/nodes/node1-ip"      
}

variable "github_ansible_jenkins_privatekey" {
  type        = string
  default     = "/jenkins/jenkins_ed22519_pri"      
}

