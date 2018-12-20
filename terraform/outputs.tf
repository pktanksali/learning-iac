output "raddit_public_ip" {
  value = "${aws_instance.raddit.0.public_ip}"
}
