output "alb_dns_front_end" {
  value = aws_alb.front_end.dns_name
}
