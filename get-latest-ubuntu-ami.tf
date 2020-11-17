##############################################
# Get latest Ubuntu Linux AMI with Terraform #
##############################################

# Get latest Ubuntu Linux Trusty 14.04 AMI
data "aws_ami" "ubuntu-linux-1404" {
  most_recent = true
  owners      = ["099720109477"] # Canonical
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Get latest Ubuntu Linux Xenial 16.04 AMI
data "aws_ami" "ubuntu-linux-1604" {
  most_recent = true
  owners      = ["099720109477"] # Canonical
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Get latest Ubuntu Linux Bionic 18.04 AMI
data "aws_ami" "ubuntu-linux-1804" {
  most_recent = true
  owners      = ["099720109477"] # Canonical
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Get latest Ubuntu Linux Disco 19.04 AMI
data "aws_ami" "ubuntu-linux-1904" {
  most_recent = true
  owners      = ["099720109477"] # Canonical
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-disco-19.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Get latest Ubuntu Linux Disco 20.04 AMI
data "aws_ami" "ubuntu-linux-2004" {
  most_recent = true
  owners      = ["099720109477"] # Canonical
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# output
output "ubuntu_1404_ami_id" {
  value = data.aws_ami.ubuntu-linux-1404.id
}

output "ubuntu_1604_ami_id" {
  value = data.aws_ami.ubuntu-linux-1604.id
}

output "ubuntu_1804_ami_id" {
  value = data.aws_ami.ubuntu-linux-1804.id
}

output "ubuntu_1904_ami_id" {
  value = data.aws_ami.ubuntu-linux-1904.id
}

output "ubuntu_2004_ami_id" {
  value = data.aws_ami.ubuntu-linux-2004.id
}
