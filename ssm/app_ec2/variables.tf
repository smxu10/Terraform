variable "instance_type" {
  type        = string
  default     = "t2.micro"
}

variable "web_access_cidr" {
  type        = string
  default     = "0.0.0.0/0"
}
