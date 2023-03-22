resource "aws_instance" "my_ec2" {
  ami                    = var.ami
  instance_type          = var.aws_instance
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  key_name = var.key_pair
}



resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"


  dynamic "ingress" {
    iterator = port
    for_each = var.ingressrules
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

  }

  dynamic "egress" {
    iterator = port
    for_each = var.egressrules
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]

    }
  }


  tags = {
    Name = "allow_tls"
  }
}