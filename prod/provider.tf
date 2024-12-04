provider "aws" {
  region = local.region
}

terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.53"
    }
  }

  # backend "s3" {
  #   # This backend configuration is filled in automatically at test time by Terratest. If you wish to run this example
  #   # manually, uncomment and fill in the config below.

  #   # bucket         = "<YOUR S3 BUCKET>"
  #   # key            = "prod/terraform.tfstate"
  #   # region         = "us-east-2"
  #   # dynamodb_table = "<YOUR DYNAMODB TABLE>"
  #   # encrypt        = true
  # }
}
