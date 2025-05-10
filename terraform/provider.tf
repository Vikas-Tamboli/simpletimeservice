provider "aws" {
  region = var.aws_region
}

terraform {

  backend "s3" {
      bucket = "icecream7758" 
      key    = "terraform/state.tfstate"
      region = "ap-south-1"
      encrypt = true 
    # dynamodb_table = "your-dynamodb-table-name" #  Optional: DynamoDB table for locking
  }
}
