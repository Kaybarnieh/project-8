# Create Security Group for the Application Load Balancer
resource "aws_security_group" "alb-security-group" {
  name        = "ALB security group"
  description = "enable HTTP/HTTPS access on port 80/443"
  vpc_id      = "${aws_vpc.my-vpc.id}"

  ingress {
    description      = "HTTP access"
    from_port        = 80   
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "HTTP access"
    from_port        = 80   
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

   egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]

}

  tags   = {
    Name = "alb security group"
  }
}

# Create Security Group for the Database
resource "aws_security_group" "database-security-group" {
  name        = "Database Security Group"
  description = "Enable MYSQL/Aurora access on Port 3306"
  vpc_id      = "${aws_vpc.my-vpc.id}"

  ingress {
    description      = "MYSQL/aurora access on port 3306"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags   = {
    Name = "Database Security Group"
  }
}