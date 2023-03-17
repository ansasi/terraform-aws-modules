# Terraform module to create S3 bucket with policy and object
resource "aws_s3_bucket" "bucket" {
  count         = var.use_existing_bucket ? 0 : 1
  bucket        = var.bucket
  force_destroy = var.force_destroy
  tags          = var.tags
}

data "aws_s3_bucket" "bucket" {
  count  = var.use_existing_bucket ? 1 : 0
  bucket = var.bucket
}

# Only create policy if policy is not empty
resource "aws_s3_bucket_policy" "bucket_policy" {
  count  = var.policy == "" ? 0 : 1
  bucket = var.use_existing_bucket ? data.aws_s3_bucket.bucket[0].id : aws_s3_bucket.bucket[0].id
  policy = var.policy
}

resource "aws_s3_object" "object" {
  for_each = { for object in var.object_list : object.key => object }
  bucket   = var.use_existing_bucket ? data.aws_s3_bucket.bucket[0].id : aws_s3_bucket.bucket[0].id
  key      = each.value.key
  source   = each.value.source
  etag     = filemd5(each.value.source)
}
