### install Jenkins
resource "aws_ssm_association" "config_jenkins_agent" {
  name = "config_jenkins_agent"

  targets {
    key    = "tag:server_tag"
    values = [var.jenkins_agent_tag] 
  }

  output_location {
    s3_bucket_name = "ssm-output-sean"
    s3_region = "us-east-1"
  }
}
