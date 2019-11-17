resource "aws_internet_gateway" "aws-wordpress-igw" {
  vpc_id = "${aws_vpc.aws-wordpress-vpc.id}"

  tags = {
    Name = "aws-wordpress-igw"
  }
}
