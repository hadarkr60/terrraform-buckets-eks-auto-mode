variable "aws_region" {
  description = "region where resources been created"
  type        = string
  default     = "us-east-1"
}

variable "bucket_count" {
  type        = number
  description = "number of buckets to be created"
  default     = 2
}
