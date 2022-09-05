provider "aws" {
  region = "us-west-2"
  access_key = "AKIAUX46VJXMDL2ISYQH"
 secret_key = "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"

}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_security_group" "var_demo" {
  name = "kplabs-variables"
  vpc_id      = aws_vpc.main.id



ingress {
  from_port = 443
  to_port = 443
  protocol = "tcp"
  cidr_blocks = [var.vpn_ip]

}

ingress {
  from_port = 80
  to_port = 80
  protocol = "tcp"
  cidr_blocks = [var.vpn_ip]
}

ingress {
  from_port = 53
  to_port = 53
  protocol = "tcp"
  cidr_blocks = [var.vpn_ip]
}
}
