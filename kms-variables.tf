#####################
## KMS - Variables ##
#####################

# KMS Configuration
variable "admin_iam_role" {
  type        = string
  description = "Admin IAM role"
  default     = ""
}
