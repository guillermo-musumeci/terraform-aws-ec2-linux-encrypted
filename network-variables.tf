##############################################
## Network Single AZ Public Only - Variables #
##############################################

# AWS AZ
variable "aws_az_dev" {
  description = "AWS AZ for Dev"
  default = "eu-west-1c"
}

# VPC Variables
variable "vpc_dev_cidr" {
  description = "CIDR for the Dev VPC"
  default = "10.1.64.0/18"
}

# Subnet Variables
variable "vpc_dev_public_subnet_cidr" {
  description = "CIDR for the Dev public subnet"
  default = "10.1.64.0/24"
}