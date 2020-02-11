#########################
## KMS Module - Output ##
#########################

output "network_kms_key_id" {
  description = "ID of custom KMS key"
  value       = "${aws_kms_key.kms-key.key_id}"
}

output "network_kms_key_arn" {
  description = "ARN of custom KMS key"
  value       = "${aws_kms_key.kms-key.arn}"
}
