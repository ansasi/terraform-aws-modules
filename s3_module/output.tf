output "s3_bucket_arn" {
  value = aws_s3_bucket.bucket.arn
}

output "s3_bucket_id" {
  value = aws_s3_bucket.bucket.id
}

output "s3_bucket_region" {
  value = aws_s3_bucket.bucket.region
}

output "object_list" {
  value = aws_s3_object.object
}