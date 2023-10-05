locals {
  install_script = file("install_jenknis.yaml")
  start_script = file("start_jenknis.yaml")
  stop_script = file("stop_jenknis.yaml")
  uninstall_script = file("uninstall_jenknis.yaml")
  config_jenkins_agent = file("config_jenkins_agent.yaml")
  test-doc = file("test-doc.yaml")
}

resource "aws_ssm_document" "install-jentins" {
  name          = "install_jenkins"
  document_type = "Command"
  document_format = "YAML"

  content = local.install_script
}

resource "aws_ssm_document" "start-jentins" {
  name          = "start_jenkins"
  document_type = "Command"
  document_format = "YAML"

  content = local.start_script
}

resource "aws_ssm_document" "stop-jentins" {
  name          = "stop_jenkins"
  document_type = "Command"
  document_format = "YAML"

  content = local.stop_script
}

resource "aws_ssm_document" "uninstall-jentins" {
  name          = "uninstall_jenkins"
  document_type = "Command"
  document_format = "YAML"

  content = local.uninstall_script
}

resource "aws_ssm_document" "config_jenkins_agent" {
  name          = "config_jenkins_agent"
  document_type = "Command"
  document_format = "YAML"

  content = local.config_jenkins_agent
}

resource "aws_ssm_document" "test-doc" {
  name          = "test-doc"
  document_type = "Command"
  document_format = "YAML"

  content = local.test-doc
}