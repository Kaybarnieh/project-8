# Create VPC
resource "aws_vpc" "my-vpc" {
  cidr_block              = "${var.vpc-cidr}"
  instance_tenancy        = "default"
  
  tags      = {
    Name    = "my-vpc" 
  }
}

# Create Public Subnet 1
resource "aws_subnet" "public-subnet-1" {
  vpc_id                  = "${aws_vpc.my-vpc.id}"
  cidr_block              = "${var.public-subnet-1-cidr}"
  availability_zone       = "eu-west-2a"
  map_public_ip_on_launch = "true"

  tags      = {
    Name    = "public-subnet1" 
  }
}

# Create Public Subnet 2
resource "aws_subnet" "public-subnet-2" {
  vpc_id                  = "${aws_vpc.my-vpc.id}"
  cidr_block              = "${var.public-subnet-2-cidr}"
  availability_zone       = "eu-west-2b"
  map_public_ip_on_launch = "true"

  tags      = {
    Name    = "public-subnet2" 
  }
}

# Create Public Subnet 3
resource "aws_subnet" "public-subnet-3" {
  vpc_id                  = "${aws_vpc.my-vpc.id}"
  cidr_block              = "${var.public-subnet-3-cidr}"
  availability_zone       = "eu-west-2c"
  map_public_ip_on_launch = "true"

  tags      = {
    Name    = "public-subnet3" 
  }
}

# Create Private Subnet 1
resource "aws_subnet" "private-subnet-1" {
  vpc_id                   = "${aws_vpc.my-vpc.id}" 
  cidr_block               = "${var.private-subnet-1-cidr}"
  availability_zone        = "eu-west-2a"
  map_public_ip_on_launch  = false

  tags      = {
    Name    = "private subnet 1 app tier"
  }
}

# Create Private Subnet 2
resource "aws_subnet" "private-subnet-2" {
  vpc_id                   = "${aws_vpc.my-vpc.id}" 
  cidr_block               = "${var.private-subnet-2-cidr}"
  availability_zone        = "eu-west-2b"
  map_public_ip_on_launch  = false

  tags      = {
    Name    = "private subnet 2 app tier"
  }
}

# Create Private Subnet 3
resource "aws_subnet" "private-subnet-3" {
  vpc_id                   = "${aws_vpc.my-vpc.id}" 
  cidr_block               = "${var.private-subnet-3-cidr}"
  availability_zone        = "eu-west-2c"
  map_public_ip_on_launch  = false

  tags      = {
    Name    = "private subnet 3 app tier"
  }
}

# Create Route Table and Add Public Route
resource "aws_route_table" "public-route-table" {
  vpc_id       ="${aws_vpc.my-vpc.id}" 
 
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet-gateway.id
  }

  tags       = {
    Name     = "public-route-table"
  }
}

# Create private Route Table
resource "aws_route_table" "private-route-table" {
  vpc_id       ="${aws_vpc.my-vpc.id}" 
 
  tags       = {
    Name     = "private-route-table"
  }
}

# Associate Public Subnet 1 to "Public Route Table"
resource "aws_route_table_association" "public-subnet-1-route-table-association" {
  subnet_id           = "${aws_subnet.public-subnet-1.id}"
  route_table_id      = "${aws_route_table.public-route-table.id}"
}

# Associate Public Subnet 2 to "Public Route Table"
resource "aws_route_table_association" "public-subnet-2-route-table-association" {
  subnet_id           = "${aws_subnet.public-subnet-2.id}"
  route_table_id      = "${aws_route_table.public-route-table.id}"
}

# Associate Public Subnet 3 to "Public Route Table"
resource "aws_route_table_association" "public-subnet-3-route-table-association" {
  subnet_id           = "${aws_subnet.public-subnet-3.id}"
  route_table_id      = "${aws_route_table.public-route-table.id}"
}

# Associate private Subnet 1 to "Private Route Table"
resource "aws_route_table_association" "Private-subnet-1-route-table-association" {
  subnet_id           = "${aws_subnet.private-subnet-1.id}"
  route_table_id      = "${aws_route_table.private-route-table.id}"
}

# Associate private Subnet 2 to "Private Route Table"
resource "aws_route_table_association" "Private-subnet-2-route-table-association" {
  subnet_id           = "${aws_subnet.private-subnet-2.id}"
  route_table_id      = "${aws_route_table.private-route-table.id}"
}

# Associate private Subnet 3 to "Private Route Table"
resource "aws_route_table_association" "Private-subnet-3-route-table-association" {
  subnet_id           = "${aws_subnet.private-subnet-3.id}"
  route_table_id      = "${aws_route_table.private-route-table.id}"
}

#Create Internet Gateway and Attach it to VPC
resource "aws_internet_gateway" "internet-gateway" {
  vpc_id    = "${aws_vpc.my-vpc.id}"

  tags      = {
    Name    = "myIGW"
  }
}







