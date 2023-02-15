# Terraform module to create S3 bucket with policy and object
resource "aws_s3_bucket" "bucket" {
  bucket        = var.bucket
  force_destroy = var.force_destroy
  tags          = var.tags
}

# Only create policy if policy is not empty
resource "aws_s3_bucket_policy" "bucket_policy" {
  count  = var.policy == "" ? 0 : 1
  bucket = aws_s3_bucket.bucket.id
  policy = var.policy
}

resource "aws_s3_object" "object" {
    for_each = { for object in var.object_list : object.key => object }
    bucket   = aws_s3_bucket.bucket.id
    key      = each.value.key
    source   = each.value.source
    etag     = filemd5(each.value.source)
}
