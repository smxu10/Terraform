#### uninstall Jenkins
resource "aws_ssm_association" "uninstall_jenkins" {
  name = "uninstall_jenkins"

  targets {
    key    = "tag:server_tag"
    values = [var.server_tag] 
  }
}