# VPC Variables
variable "aws_region" {
  default       = "eu-west-2"
  description   = "AWS Region"
  type          = string
}

variable "vpc-cidr" {
  default       = "10.0.0.0/16"
  description   = "vpc cidr block"
  type          = string
}

variable "public-subnet-1-cidr" {
  default       = "10.0.1.0/24"
  description   = "public subnet 1 cidr block"
  type          = string
}

variable "public-subnet-2-cidr" {
  default       = "10.0.2.0/24"
  description   = "public subnet 2 cidr block"
  type          = string
}

variable "public-subnet-3-cidr" {
  default       = "10.0.3.0/24"
  description   = "public subnet 3 cidr block"
  type          = string
}

variable "private-subnet-1-cidr" {
  default       = "10.0.4.0/24"
  description   = "private subnet 1"
  type          = string
}

variable "private-subnet-2-cidr" {
  default       = "10.0.5.0/24"
  description   = "private subnet 2"
  type          = string
}

variable "private-subnet-3-cidr" {
  default       = "10.0.6.0/24"
  description   = "private subnet 3"
  type          = string
}

variable "database-instance_class" {
  default       = "db.t3-micro"
  description   = "database instance type"
  type          = string
}

variable "username" {
  default       = "kaybarnieh"
  description   = "username for my db"
  type          = string
}

variable "password" {
  default       = "Pennysaph09"
  description   = "password for my db"
  type          = string
}

variable "database-snapshot_identifier" {
  default       = "arn:aws:rds:eu-west-2:149580742500:snapshot:kaybee"
  description   = "database snapshot ARN"
  type          = string
}
