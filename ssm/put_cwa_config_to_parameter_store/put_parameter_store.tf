resource "aws_ssm_parameter" "cwa-httpd" {
  name  = "AmazonCloudWatch-agent-config-httpd"
  type  = "String"
  value = var.cwa_httpd
}
