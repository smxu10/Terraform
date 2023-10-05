resource "aws_security_group" "jenkins" {
  name   = "jenkins"
  vpc_id = data.terraform_remote_state.dhmc.outputs.vpc_id

  # egress {
  #   description = "unrestricted egress to the world"
  #   from_port   = 0
  #   to_port     = 0
  #   protocol    = -1
  #   cidr_blocks = ["0.0.0.0/0"]
  # }

  tags = {
    Name = "jenkins"
  }
}

resource "aws_security_group_rule" "web_access_80" {
  security_group_id = aws_security_group.jenkins.id
  type        = "ingress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]  #[var.web_access_cidr]
  description = "web_access_80"
}

# jenkins web ui
resource "aws_security_group_rule" "web_access_443" {
  security_group_id = aws_security_group.jenkins.id
  type        = "ingress"
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  cidr_blocks = [var.web_access_cidr]
  description = "web_access_443"
}

resource "aws_security_group_rule" "jenjins_proxy" {
  security_group_id = aws_security_group.jenkins.id
  type        = "ingress"
  from_port   = 8080
  to_port     = 8080
  protocol    = "tcp"
  cidr_blocks = [var.web_access_cidr]
  description = "Jenkins proxy"
}

resource "aws_security_group_rule" "ping" {
  security_group_id = aws_security_group.jenkins.id
  type        = "ingress"
  from_port   = -1
  to_port     = -1
  protocol    = "icmp"
  cidr_blocks = ["172.31.0.0/16"]
  description = "ping"
}

resource "aws_security_group_rule" "ssh" {
  security_group_id = aws_security_group.jenkins.id
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["172.31.0.0/16"]
  description = "ssh connection"
}

resource "aws_security_group_rule" "egress" {
  security_group_id = aws_security_group.jenkins.id
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = [var.web_access_cidr]
  description = "egress"
}





