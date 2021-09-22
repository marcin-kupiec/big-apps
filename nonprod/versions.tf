terraform {
  required_version = "= 1.0.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.51.0"
    }
  }

  backend "s3" {
    region = "eu-central-1"
    key    = "state"
    bucket = "big-apps-tfm"
    //    dynamodb_table = "terraform-locks"
  }
}