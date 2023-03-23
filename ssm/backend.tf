terraform {
  backend "s3" {
    bucket = "tfstate1"
    key    = "ssm/terraform.tfstate"
    region = "us-east-1"
  }
}