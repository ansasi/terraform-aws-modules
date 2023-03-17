output "s3_bucket_arn" {
  value = var.use_existing_bucket ? data.aws_s3_bucket.bucket[0].arn : aws_s3_bucket.bucket[0].arn
}

output "s3_bucket_id" {
  value = var.use_existing_bucket ? data.aws_s3_bucket.bucket[0].id : aws_s3_bucket.bucket[0].id
}

output "s3_bucket_region" {
  value = var.use_existing_bucket ? data.aws_s3_bucket.bucket[0].region : aws_s3_bucket.bucket[0].region
}

output "object_list" {
  value = aws_s3_object.object
}
