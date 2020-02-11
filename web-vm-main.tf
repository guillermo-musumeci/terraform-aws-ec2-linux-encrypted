###################################
## Virtual Machine Module - Main ##
###################################

# Create Elastic IP for EC2 instance
resource "aws_eip" "web-eip" {
  vpc = true
  tags = {
    Name = "${lower(var.app_name)}-${var.app_environment}-web-eip"
    Environment = var.app_environment
  }
}

# Create EC2 Instance
resource "aws_instance" "web-server" {
  ami                         = data.aws_ami.ubuntu-linux-1804.id
  instance_type               = var.web_instance_type
  subnet_id                   = aws_subnet.dev-public-subnet.id
  vpc_security_group_ids      = [aws_security_group.aws-web-sg.id]
  associate_public_ip_address = var.web_associate_public_ip_address
  source_dest_check           = false
  key_name                    = var.web_key_pair
  user_data                   = file("aws-user-data.sh")
  #iam_instance_profile        = aws_iam_instance_profile.ec2-profile.name
  
  # root disk
  root_block_device {
    volume_size           = var.web_root_volume_size
    volume_type           = var.web_root_volume_type
    delete_on_termination = true
    encrypted             = true
    kms_key_id            = aws_kms_key.kms-key.arn
  }

  # extra disk
  ebs_block_device {
    device_name           = "/dev/xvda"
    volume_size           = var.web_data_volume_size
    volume_type           = var.web_data_volume_type
    encrypted             = true
    kms_key_id            = aws_kms_key.kms-key.key_id
    delete_on_termination = true
  }
  
  tags = {
    Name = "${lower(var.app_name)}-${var.app_environment}-web-server"
    Environment = var.app_environment
  }
}

# Associate Elastic IP to Web Server
resource "aws_eip_association" "web-eip-association" {
  instance_id = aws_instance.web-server.id
  allocation_id = aws_eip.web-eip.id
}

# Define the security group for HTTP web server
resource "aws_security_group" "aws-web-sg" {
  name = "${lower(var.app_name)}-${var.app_environment}-web-sg"
  description = "Allow incoming HTTP connections"
  vpc_id = aws_vpc.dev-vpc.id

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${lower(var.app_name)}-${var.app_environment}-web-sg"
    Environment = var.app_environment
  }
}
