//To attach an aws instance to eip

provider "aws" {
  region = "us-west-2"
  accesskey=""
  secret_key=""

}

resource "aws_instance " "myec2" {
  ami = ""
  instance_type = "t2.micro"

}

resource "aws_eip" "lb" {
  vpc = "true"

}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.myec2.id
  allocation_id = aws_eip.lb.id
}

//attaching a secuirty group

resource "aws_security_group" "allow_tls" {
  name        = "mithra-security-group"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [${aws_eip.lb.public_ip}/32]

  }


  tags = {
    Name = "allow_tls"
  }
}
