terraform {
  backend "s3" {
    bucket = "tfstate1"
    key    = "lambda/ec2/ec2-desc/terraform.tfstate"
    region = "us-east-1"
  }
}
