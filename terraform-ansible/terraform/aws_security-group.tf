## security group (web-server)
resource "aws_security_group" "web-server-sg" {
  name        = "web-server-sg"
  description = "web-server-sg"
  vpc_id      = "${aws_vpc.aws-wordpress-vpc.id}"

  ingress {
    from_port   = 80
    to_port     = 80
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

  tags = {
    Name = "web-server-sg"
  }
}

## security group (rds)
resource "aws_security_group" "db-server-sg" {
  name        = "db-server-sg"
  description = "db-server-sg"
  vpc_id      = "${aws_vpc.aws-wordpress-vpc.id}"

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = ["${aws_security_group.web-server-sg.id}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "db-server-sg"
  }
}

## security group (alb)
resource "aws_security_group" "alb-wordpress-sg" {
  name        = "alb-wordpress-sg"
  description = "alb-wordpress-sg"
  vpc_id      = "${aws_vpc.aws-wordpress-vpc.id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "alb-wordpress-sg"
  }
}
