variable region {
type = string
default = "ap-east-1"
}

data "aws_vpc" "default" {
  default = true
}


data "aws_subnet_ids" "default" {
  vpc_id = data.aws_vpc.default.id
}

output "aws_subnet_ids" {

  value = data.aws_subnet_ids.default.ids

}

output "aws_vpc" {
  value = data.aws_vpc.default.id
}


output "aws_s3_bucket" {
  value = aws_s3_bucket.terraform_state.bucket
}

output "s3_bucket_arn" {
  value       = aws_s3_bucket.terraform_state.arn
  description = "The ARN of the S3 bucket"
}

output "dynamodb_table_name" {
  value       = aws_dynamodb_table.terraform_locks.name
  description = "The name of the DynamoDB table"
}

output "aws_securityhub_product_subscription" {
 value = aws_securityhub_product_subscription.example
}
