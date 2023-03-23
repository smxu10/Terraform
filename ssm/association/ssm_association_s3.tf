resource "aws_ssm_association" "ssm-s3" {
  name = var.aws_managed_ssm_document

  association_name = var.ssm_association_s3_name
 
  schedule_expression = var.schedule

  targets {
    key    = "tag:Name"
    values = [var.instance_tag["Name"] ]
  }

  parameters = {
        SourceType = "S3"

        # SourceInfo = "https\\://s3.amazonaws.com/ansible-pb/installhttpd/playbook.yml"  // failed
        # SourceInfo = { path = "https://s3.amazonaws.com/ansible-pb/installhttpd/playbook.yml"}  // failed
        # SourceInfo = "{\"path\":\"https://s3.amazonaws.com/ansible-pb/creadedir/playbook.yml\"}"  // works!
        SourceInfo = "{\"path\":\"https://s3.amazonaws.com/${var.bucket}/${var.bucket_prefix_1}/${var.s3_playbook}\", \"path\":\"https://s3.amazonaws.com/${var.bucket}/${var.bucket_prefix_2}/${var.s3_playbook}\"}" // works!
   
        InstallDependencies = "True"
        PlaybookFile = var.s3_playbook 
        ExtraVariables = "SSM=True"
        Check = "False"
        Verbose = "-v"
  }
}