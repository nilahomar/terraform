resource "aws_vpc" "main" {
  cidr_block       = "192.168.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}

resource "aws_subnet" "public_01" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "192.168.0.0/18"

  tags = {
    Name = "public-01"
  }
}

resource "aws_subnet" "public_02" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "192.168.64.0/18"

  tags = {
    Name = "public-02"
  }
}

resource "aws_subnet" "private_01" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "192.168.128.0/18"

  tags = {
    Name = "private-01"
  }
}

resource "aws_subnet" "private_02" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "192.168.192.0/18"

  tags = {
    Name = "private-02"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "public"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "192.168.0.0/16"
    gateway_id = "local"
  }

  tags = {
    Name = "private"
  }
}

resource "aws_route_table_association" "public_01" {
  subnet_id      = aws_subnet.public_01.id
  route_table_id = aws_route_table.public.id
}


resource "aws_route_table_association" "public_02" {
  subnet_id      = aws_subnet.public_02.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private_01" {
  subnet_id      = aws_subnet.private_01.id
  route_table_id = aws_route_table.private.id
}


resource "aws_route_table_association" "private_02" {
  subnet_id      = aws_subnet.private_02.id
  route_table_id = aws_route_table.private.id
}
