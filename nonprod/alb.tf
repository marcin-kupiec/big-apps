resource "aws_alb" "front_end" {
  name               = "front-end"
  internal           = false
  load_balancer_type = "application"

  enable_cross_zone_load_balancing = true

  security_groups = [aws_security_group.public_http.id]
  subnets         = data.aws_subnet_ids.public.ids

  #  access_logs {
  #    bucket  = aws_s3_bucket.logs.bucket
  #    prefix  = "alb-front"
  #    enabled = true
  #  }

  tags = {
    Environment = "nonprod"
  }
}

resource "aws_alb_target_group" "front_end" {
  name     = "front-end-tg"
  vpc_id   = var.vpc_id
  port     = 80
  protocol = "HTTP"

  target_type = "instance"

  tags = {
    Environment = "nonprod"
  }
}

resource "aws_alb_listener" "alb_front_end_listener" {
  load_balancer_arn = aws_alb.front_end.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.front_end.arn
    type             = "forward"
  }
}
