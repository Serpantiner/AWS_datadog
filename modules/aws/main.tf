resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "main-vpc"
  }
}

resource "aws_subnet" "main" {
  count = 2

  vpc_id     = aws_vpc.main.id
  cidr_block = element(["10.0.1.0/24", "10.0.2.0/24"], count.index)

  tags = {
    Name = "main-subnet-${count.index}"
  }
}
