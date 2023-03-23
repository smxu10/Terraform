variable "ssm_association_name" {
  type        = string
  default     = "s3-ansible-tf"
}

variable "aws_managed_ssm_document" {
  type        = string
  default     = "AWS-ApplyAnsiblePlaybooks"
}

variable "bucket" {
  type        = string
  default     = "ansible-pb"
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

variable "playbook" {
  type        = string
  default     = "playbook.yml"     # ARM ami:    "ami-0f69dd1d0d03ad669"
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