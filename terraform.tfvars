# Application Definition 
app_name        = "kopicloud" # Do NOT enter any spaces
app_environment = "dev"       # Dev, Test, Staging, Prod, etc

# AWS Settings
aws_access_key = "complete-this"
aws_secret_key = "complete-this"
aws_region     = "eu-west-1"

# Web Virtual Machine
web_instance_type               = "t2.micro"
web_key_pair                    = "kopicloud-dev-ireland"
web_associate_public_ip_address = true
web_root_volume_size            = 20
web_root_volume_type            = "gp2"
web_data_volume_size            = 10
web_data_volume_type            = "gp2"
