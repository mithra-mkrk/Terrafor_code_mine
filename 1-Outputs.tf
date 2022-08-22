provider "aws" {

region = "us-west-2"
accesskey = ""
secert_key =""

}

resource "aws_eip" "lb" {
  vpc = "true"

}

output "eip" {

  value = aws_eip.lb.public_ip

}


resource "aws_s3_buket" "mys3" {

buket = "kplabs-attribute-demo-007"

}

output "mys3buket" {

 value = aws_s3_buket.mys3.buket_domain_name

}
