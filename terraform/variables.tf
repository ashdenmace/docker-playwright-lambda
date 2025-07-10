variable "AWS_REGION" {
  type        = string
  description = "AWS region"
}

variable "AWS_ACCESS_KEY_ID" {
  type        = string
  description = "AWS access key (usually passed via TF_VAR or environment)"
}

variable "AWS_SECRET_ACCESS_KEY" {
  type        = string
  description = "AWS secret key (same as above)"
  sensitive   = true
}