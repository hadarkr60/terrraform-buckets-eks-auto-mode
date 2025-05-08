resource "random_id" "suffix" {
  count       = var.bucket_count
  byte_length = 4
}

locals {
  buckets = {
    for i in range(1, var.bucket_count + 1) : "bucket${i}" => {
      bucket_name = "bucket${i}"
      suffix      = random_id.suffix[i - 1].hex
      tags = {
        Owner   = "owner${i}"
        Purpose = "bucket${i}"
      }
    }
  }
}

module "buckets" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.8.0"

  for_each = local.buckets

  bucket = "${each.value.bucket_name}-${each.value.suffix}"
  acl    = null

  versioning = {
    enabled = true
  }

  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm     = "AES256"
      }
    }
  }

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  tags = each.value.tags
}
