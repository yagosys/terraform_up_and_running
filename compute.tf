variable server_port {
  type    = number
  default = 8080
}

variable "user_specified_ami" {
 default = "ami-c790d6b6"
}

resource "aws_instance" "example" {
  ami           = var.user_specified_ami

  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.instance.id]
  user_data = <<-EOF
	#!/bin/bash
	echo 'hello world' > index.html
	nohup busybox httpd -f -p ${var.server_port} & 
	EOF
   tags =  {
     Name = "terraform-example"
	}
}

resource "aws_security_group" "instance" {
  name = "terraform-example-instance"
  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "aws_instance" {
value = aws_instance.example
}
