variable "aws_region" {
  default     = "us-east-1"
}
variable "db_password" {
  description = "The password for the RDS instance"
  type        = string
  default     = "TwinkleMishra123!"
  sensitive   = true
}
