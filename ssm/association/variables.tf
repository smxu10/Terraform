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
  default     = "ansible-pb"
}

variable "instance_tag" {
  type        = map
  default = {
    "Name" = "cribl-"
  }
}

variable "schedule" {
  type        = string
  default     = "cron(0 0 0/4 * * ? *)"
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

variable "s3_playbook" {
  type        = string
  default     = "playbook.yml"     
}

variable "github_playbook" {
  type        = string
  default     = "install-httpd.yml"     
}

variable "github_owner" {
  type        = string
  default     = "/github/owner"     
}

variable "github_repo" {
  type        = string
  default     = "/github/repo"     
}

variable "github_path" {
  type        = string
  default     = "/github/path"      
}


