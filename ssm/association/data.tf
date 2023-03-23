data "aws_ssm_parameter" "github-owner" {
  name = var.github_owner
}

data "aws_ssm_parameter" "github-repo" {
  name = var.github_repo
}

data "aws_ssm_parameter" "github-path" {
  name = var.github_path
}