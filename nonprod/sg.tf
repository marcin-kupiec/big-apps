# Allow HTTP(S) traffic from internet to Load Balancer
resource "aws_security_group" "public_http" {
  name        = "public-http"
  description = "Allow HTTP and HTTPS traffic from internet"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = data.aws_vpc.this.id

  tags = {
    Name = "public-http"
    Env  = "nonprod"
  }
}
