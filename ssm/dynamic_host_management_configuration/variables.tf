variable "aws_region" {
  type        = string
  default     = "us-east-1"
}

variable "account_id" {
  type        = string
  default     = "/account/account_id"
}

variable "vpc_id" {
  type        = string
  default     = "/vpc/vpc_id"
}

variable "subnet_id" {
  type        = string
  default     = "/vpc/subnet_id"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
}


