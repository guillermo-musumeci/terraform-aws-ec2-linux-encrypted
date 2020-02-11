##########################################
## Network Single AZ Public Only - Main ##
##########################################

#Create the Dev VPC
resource "aws_vpc" "dev-vpc" {
  cidr_block = var.vpc_dev_cidr
  enable_dns_hostnames = true
  tags = {
    Name = "${lower(var.app_name)}-dev-vpc"
    Environment = var.app_environment
  }
}

#Define the Dev public subnet
resource "aws_subnet" "dev-public-subnet" {
  vpc_id = aws_vpc.dev-vpc.id
  cidr_block = var.vpc_dev_public_subnet_cidr
  availability_zone = var.aws_az_dev
  tags = {
    Name = "${lower(var.app_name)}-dev-public-subnet"
    Environment = var.app_environment
  }
}

#Define the Dev internet gateway
resource "aws_internet_gateway" "dev-gw" {
  vpc_id = aws_vpc.dev-vpc.id
  tags = {
    Name = "${lower(var.app_name)}-dev-igw"
    Environment = var.app_environment
  }
}

#Define the Dev public route table
resource "aws_route_table" "dev-public-rt" {
  vpc_id = aws_vpc.dev-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev-gw.id
  }
  tags = {
    Name = "${lower(var.app_name)}-dev-public-subnet-rt"
    Environment = var.app_environment
  }
}

#Assign the Dev public route table to the public Subnet
resource "aws_route_table_association" "dev-public-rt-association" {
  subnet_id = aws_subnet.dev-public-subnet.id
  route_table_id = aws_route_table.dev-public-rt.id
}
