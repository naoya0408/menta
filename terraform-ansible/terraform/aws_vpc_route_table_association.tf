## Public
resource "aws_route_table_association" "route-public-1a" {
  subnet_id      = "${aws_subnet.public-subnet-1a.id}"
  route_table_id = "${aws_route_table.aws-public-route.id}"
}

resource "aws_route_table_association" "route-public-1c" {
  subnet_id      = "${aws_subnet.public-subnet-1c.id}"
  route_table_id = "${aws_route_table.aws-public-route.id}"
}

## Private
resource "aws_route_table_association" "route-private-1a" {
  subnet_id      = "${aws_subnet.private-subnet-1a.id}"
  route_table_id = "${aws_route_table.aws-private-route.id}"
}

resource "aws_route_table_association" "route-private-1c" {
  subnet_id      = "${aws_subnet.private-subnet-1c.id}"
  route_table_id = "${aws_route_table.aws-private-route.id}"
}
