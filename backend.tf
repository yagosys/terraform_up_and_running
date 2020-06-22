terraform {
  backend "s3" {
    bucket         = "terraform-up-and-running-state-wandy-1"
    key            = "global/s3/terraform.tfstate"
    region         = "ap-east-1"
    dynamodb_table = "terraform-up-and-running-locks_andy"
    encrypt        = true
  }

}

