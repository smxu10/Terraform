terraform {
  required_version = "~> 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "stfstate"
    key            = "ssm/ec2/terraform.tfstate"
    acl            = "bucket-owner-full-control"
    region         = "us-east-1"
  }
}

provider "aws" {
    region = "us-east-1"
}

data "terraform_remote_state" "dhmc" {
  backend = "s3"

  config = {
    bucket = "stfstate"
    key    = "ssm/dhmc/terraform.tfstate"
    region = "us-east-1"
  }
}