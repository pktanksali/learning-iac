resource "aws_security_group" "raddit" {
  name        = "allow-raddit-tcp-9292"
  description = "Allow all inbound traffic to port 9292"

  ingress {
    from_port   = 9292
    to_port     = 9292
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_instance" "raddit" {
  ami 		  = "ami-0b5c90103bebc9c57"
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.raddit.name}"]

  tags = {
    Name = "raddit-iac"
  }
}
