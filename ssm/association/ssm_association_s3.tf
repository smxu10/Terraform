resource "aws_ssm_association" "ssm-s3" {
  name = var.aws_managed_ssm_document

  association_name = var.ssm_association_s3_name
 
  schedule_expression = var.schedule

  targets {
    key    = "tag:Name"
    values = [var.instance_tag["Name"] ]
  }

  max_concurrency = "20%"
  max_errors = "20%"
  
  parameters = {
        SourceType = "S3"

        SourceInfo = "{\"path\":\"https://s3.amazonaws.com/${var.bucket}/${var.bucket_prefix_1}/${var.s3_playbook_1}\"}"
        InstallDependencies = "True"
        PlaybookFile = var.s3_playbook_1 
        ExtraVariables = "SSM=True"
        Check = "False"
        Verbose = "-v"
  }
}