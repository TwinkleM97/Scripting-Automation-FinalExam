variable "my_last_name" {
  default = "mishra" 
}

variable "my_last_four_digits_of_student_id" {
  default = "4858"
}

resource "aws_s3_bucket" "vault" {
  bucket = "${var.my_last_name}-${var.my_last_four_digits_of_student_id}-bucket"

  tags = {
    Name        = "Twinkles_Vault_Bucket"
    Environment = "prod"
  }
}

resource "aws_s3_bucket_versioning" "vault_versioning" {
  bucket = aws_s3_bucket.vault.id

  versioning_configuration {
    status = "Enabled"
  }
}

output "s3_bucket_name" {
  value = aws_s3_bucket.vault.bucket
}
