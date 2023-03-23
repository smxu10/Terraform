resource "aws_ssm_association" "ssm-github" {
  name = var.aws_managed_ssm_document

  association_name = var.ssm_association_github_name
 
  schedule_expression = var.schedule

  targets {
    key    = "tag:Name"
    values = [var.instance_tag["Name"] ]
  }
  
  max_concurrency = "20%"
  max_errors = "20%"

  parameters = {
        SourceType = "GitHub",
        # SourceInfo = "{ \"owner\":\"${var.github_owner}\",\"repository\":\"${var.github_repo}\",\"path\":\"${var.github_path}\",\"getOptions\":\"branch:master\" }"
        SourceInfo = "{ \"owner\":\"${data.aws_ssm_parameter.github-owner.value}\",\"repository\":\"${data.aws_ssm_parameter.github-repo.value}\",\"path\":\"${data.aws_ssm_parameter.github-path.value}\",\"getOptions\":\"branch:master\" }"
        InstallDependencies = "True"
        PlaybookFile = var.github_playbook 
        ExtraVariables = "SSM=True"
        Check = "False"
        Verbose = "-v"
  }
}