provider "aws" {
  region = "eu-central-1"

  assume_role {
    role_arn = "arn:aws:iam::457216363251:role/AdminRole"
  }
}
