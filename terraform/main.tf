resource "aws_security_group" "raddit" {
  name        = "allow-raddit-tcp-9292"
  description = "Allow all inbound traffic to port 9292"

  ingress {
    from_port   = 9292
    to_port     = 9292
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_instance" "raddit" {
  ami 		  = "${var.ami_id}"
  instance_type   = "t2.micro"
  key_name        = "prasadSpinnakerAWS"
  security_groups = ["${aws_security_group.raddit.name}"]

  tags = {
    Name = "raddit-iac"
  }
}
