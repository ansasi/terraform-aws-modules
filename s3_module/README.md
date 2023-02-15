# S3 Module

This module creates an S3 bucket, with an specific policy and objects.

It can receive a list of objects to be created in the bucket.

## Usage

```hcl
module "s3" {
  source = "github.com/ansasi/terraform-aws-modules/s3_module"

  bucket_name = "my-bucket"
  bucket_policy = "my-bucket-policy"
  bucket_objects = [
    {
      key = "my-object"
      source = "my-object-source"
    }
  ]
}
```

## Resources

| Name | Type |
|------|------|
| [aws_s3_bucket.bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_object.object](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object) | resource |
| [aws_s3_bucket_policy.bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bucket\_name | The name of the bucket. If omitted, Terraform will assign a random, unique name. | `string` | n/a | yes |
| tags | A mapping of tags that identify the bucket. | `map(string)` | `{}` | no |
| force\_destroy | A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable. | `bool` | `false` | no |
| bucket\_policy | The bucket policy as a JSON document. | `string` | `""` | no |
| object\_list | A list of objects to be created in the bucket. | `list(object({ key = string source = string }))` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| s3\_bucket\_arn | The ARN of the bucket. |
| s3\_bucket\_id | The name of the bucket. |
| s3\_bucket\_region | The bucket region. |
| object\_list | The list of objects created in the bucket. |

## Authors

Module managed by Ángel Sánchez Sierra - [(angel.sanchez@datacentric.es)](mailto:angel.sanchez@datacentric.es)
