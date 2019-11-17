## Public subnet
resource "aws_subnet" "public-subnet-1a" {
  vpc_id            = "${aws_vpc.aws-wordpress-vpc.id}"
  cidr_block        = "10.0.0.0/24"
  availability_zone = "ap-northeast-1a"

  tags = {
    Name = "public-subnet-1a"
  }
}

resource "aws_subnet" "public-subnet-1c" {
  vpc_id            = "${aws_vpc.aws-wordpress-vpc.id}"
  cidr_block        = "10.0.2.0/24"
  availability_zone = "ap-northeast-1c"

  tags = {
    Name = "public-subnet-1c"
  }
}

## Private subnet
resource "aws_subnet" "private-subnet-1a" {
  vpc_id            = "${aws_vpc.aws-wordpress-vpc.id}"
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-northeast-1a"

  tags = {
    Name = "private-subnet-1a"
  }
}

resource "aws_subnet" "private-subnet-1c" {
  vpc_id            = "${aws_vpc.aws-wordpress-vpc.id}"
  cidr_block        = "10.0.3.0/24"
  availability_zone = "ap-northeast-1c"

  tags = {
    Name = "private-subnet-1c"
  }
}
