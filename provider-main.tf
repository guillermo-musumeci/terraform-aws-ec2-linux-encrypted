################################
## AWS Provider Module - Main ##
################################

# AWS Provider
provider "aws" {
  version    = "~> 2.26.0"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.aws_region
}

data "aws_caller_identity" "current" {}