// here we are not hardcoding the cidr_blocks , we would be refering to the variables.tf file .
// in Varabilbe.tf we would be providing the cidr
//below code for variables.tf file
/*variable "vpn_ip" {
  default = "116.50.30.20/32"
}
*/

resource "aws_security_group" "var_demo" {
  name = "mithra-variables"

}

ingress {
  from_port =443
  to_port =443
  protocol ="tcp"
  cidr_blocks=[var.vpn_ip]
}

ingress {
  from_port = 80
  to_port =80
  protocol="tcp"
  cidr_blocks=[var.vpn_ip]

}

ingress {
  from_port=53
  to_port=53
  protocol="tcp"
  cidr_blocks=[var.vpn_ip]
}
