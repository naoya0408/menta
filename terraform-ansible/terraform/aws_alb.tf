resource "aws_alb" "aws-wordpress-alb" {
  name                       = "aws-wordpress-alb"
  security_groups            = ["${aws_security_group.alb-wordpress-sg.id}"]
  subnets                    = ["${aws_subnet.public-subnet-1a.id}", "${aws_subnet.public-subnet-1c.id}"]
  internal                   = false
  enable_deletion_protection = false
}

resource "aws_alb_target_group" "aws-wordpress-tg" {
  name     = "aws-wordpress-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "${aws_vpc.aws-wordpress-vpc.id}"

  health_check {
    interval            = 10
    path                = "/"
    port                = 80
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
    matcher             = 200
  }
}

resource "aws_alb_target_group_attachment" "alb-a" {
  target_group_arn = "${aws_alb_target_group.aws-wordpress-tg.arn}"
  target_id        = "${aws_instance.web-server-1a.id}"
  port             = 80
}

resource "aws_alb_target_group_attachment" "alb-c" {
  target_group_arn = "${aws_alb_target_group.aws-wordpress-tg.arn}"
  target_id        = "${aws_instance.web-server-1c.id}"
  port             = 80
}

resource "aws_alb_listener" "alb" {
  load_balancer_arn = "${aws_alb.aws-wordpress-alb.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_alb_target_group.aws-wordpress-tg.arn}"
    type             = "forward"
  }
}
