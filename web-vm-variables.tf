########################################
## Virtual Machine Module - Variables ##
########################################

variable "web_instance_type" {
  type        = string
  description = "EC2 instance type for Web Server"
  default     = "t2.micro"
}

variable "web_key_pair" {
  type        = string
  description = "AWS Key Pair for Web Server"
}

variable "web_associate_public_ip_address" {
  type        = bool
  description = "Associate a public IP address to the EC2 instance"
}

variable "web_root_volume_size" {
  type        = number
  description = "Volumen size of root volumen of Web Server"
}

variable "web_data_volume_size" {
  type        = number
  description = "Volumen size of data volumen of Web Server"
}

variable "web_root_volume_type" {
  type        = string
  description = "Volumen type of root volumen of Web Server. Can be standard, gp2, io1, sc1 or st1"
  default     = "gp2"
}

variable "web_data_volume_type" {
  type        = string
  description = "Volumen type of data volumen of Web Server. Can be standard, gp2, io1, sc1 or st1"
  default     = "gp2"
}