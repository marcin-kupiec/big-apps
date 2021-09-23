# Allow HTTP(S) traffic from internet to Load Balancer
resource "aws_security_group" "public_http" {
  name        = "public-http"
  vpc_id      = data.aws_vpc.this.id
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

  tags = {
    Name = "public-http"
    Env  = "nonprod"
  }
}

resource "aws_security_group" "front_1_task" {
  name   = "front_1_task"
  vpc_id = data.aws_vpc.this.id

  ingress {
    protocol        = "tcp"
    from_port       = 3000
    to_port         = 3000
    security_groups = [aws_security_group.public_http.id]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
