## Public route
resource "aws_route_table" "aws-public-route" {
  vpc_id = "${aws_vpc.aws-wordpress-vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.aws-wordpress-igw.id}"
  }

  tags = {
    Name = "aws-public-route"
  }
}

## Private route
resource "aws_route_table" "aws-private-route" {
  vpc_id = "${aws_vpc.aws-wordpress-vpc.id}"

  tags = {
    "Name" = "aws-private-route"
  }
}
