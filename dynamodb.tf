
resource "aws_dynamodb_table" "terraform_locks" {
 name = "terraform-up-and-running-locks_andy"
 billing_mode = "PAY_PER_REQUEST"
 hash_key  = "LockID"
 read_capacity = 5
 write_capacity = 5

 attribute {
   name = "LockID"
   type = "S"
 }
}

