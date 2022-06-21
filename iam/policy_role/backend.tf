terraform {
  backend "s3" {
    bucket = "tfstate1"
    key    = "iam/terraform.tfstate"
    region = "us-east-1"
  }
}
