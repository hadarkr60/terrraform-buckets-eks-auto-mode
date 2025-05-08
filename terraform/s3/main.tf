module "native_s3" {
  source        = "./native-resource"
  bucket_count  = var.bucket_count
}

module "aws_module" {
  source        = "./aws-module"
  bucket_count  = var.bucket_count
}

