##EC2(web-server-1a)
resource "aws_instance" "web-server-1a" {
  ami                         = "${var.ami}"
  instance_type               = "${var.instance_type}"
  associate_public_ip_address = true
  disable_api_termination     = false
  key_name                    = "aws-ssh-key"
  vpc_security_group_ids      = ["${aws_security_group.web-server-sg.id}"]
  subnet_id                   = "${aws_subnet.public-subnet-1a.id}"

  ebs_block_device {
    device_name = "/dev/xvda"
    volume_type = "gp2"
    volume_size = "${var.volume_size}"
  }

  tags = {
    Name = "web-server-1a"
  }
}

##EC2(web-server-1c)
resource "aws_instance" "web-server-1c" {
  ami                         = "${var.ami}"
  instance_type               = "${var.instance_type}"
  associate_public_ip_address = true
  disable_api_termination     = false
  key_name                    = "aws-ssh-key"
  vpc_security_group_ids      = ["${aws_security_group.web-server-sg.id}"]
  subnet_id                   = "${aws_subnet.public-subnet-1c.id}"

  ebs_block_device {
    device_name = "/dev/xvda"
    volume_type = "gp2"
    volume_size = "${var.volume_size}"
  }

  tags = {
    Name = "web-server-1c"
  }
}
