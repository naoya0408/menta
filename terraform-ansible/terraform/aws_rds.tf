# Create subnet group
resource "aws_db_subnet_group" "db-subnet-group" {
  name        = "db-subnet-group"
  description = "db-subnet-group"
  subnet_ids  = ["${aws_subnet.private-subnet-1a.id}", "${aws_subnet.private-subnet-1c.id}"]

  tags = {
    name = "db-subnet-group"
  }
}

# Create RDS-instance
resource "aws_db_instance" "my-db-instance" {
  identifier              = "my-db-instance"
  allocated_storage       = 20
  engine                  = "mysql"
  engine_version          = "8.0.16"
  instance_class          = "${var.instance_class}"
  availability_zone       = "ap-northeast-1a"
  storage_type            = "gp2"
  name                    = "${var.database_name}"
  username                = "${var.username}"
  password                = "${var.password}"
  skip_final_snapshot     = true
  publicly_accessible     = false
  backup_retention_period = 7
  vpc_security_group_ids  = ["${aws_security_group.db-server-sg.id}"]
  db_subnet_group_name    = "${aws_db_subnet_group.db-subnet-group.name}"
}
