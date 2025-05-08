locals {
  buckets = [
    for i in range(1, var.bucket_count + 1) : {
      bucket_name = "bucket${i}"
      bucket_tags = {
        Owner   = "Owner${i}"
        Purpose = "Bucket${i}"
      }
    }
  ]
}

resource "random_id" "bucket_suffix" {
  count        = var.bucket_count
  byte_length  = 4
}

locals {
  bucket_map = {
    for idx, b in local.buckets :
    b.bucket_name => merge(b, {
      suffix = random_id.bucket_suffix[idx].hex
    })
  }
}

resource "aws_s3_bucket" "buckets" {
  for_each = local.bucket_map

  bucket   = "${each.value. bucket_name}-${each.value.suffix}"
  tags     = each.value.bucket_tags
}
