# s3
resource "aws_s3_bucket" "logs" {
  bucket = "big-apps-logs"
  acl    = "log-delivery-write"

  tags = {
    Name        = "logs-bucket"
    Environment = "nonprod"
  }
}