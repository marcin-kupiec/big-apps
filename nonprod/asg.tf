#resource "aws_launch_template" "micro_tmpl" {
#  name_prefix   = "micro"
#  image_id      = "ami-07df274a488ca9195"
#  instance_type = "t2.micro"
#
#  key_name               = aws_key_pair.access_key.key_name
#  vpc_security_group_ids = [aws_security_group.public_http.id]
#}
#
#resource "aws_autoscaling_group" "front_end" {
#  name                      = "front-end"
#  max_size                  = 5
#  min_size                  = 2
#  health_check_grace_period = 300
#  health_check_type         = "ELB"
#  force_delete              = true
#
#  vpc_zone_identifier = data.aws_subnet_ids.public.ids
#  target_group_arns   = [aws_alb_target_group.front_end.arn]
#
#  launch_template {
#    id      = aws_launch_template.micro_tmpl.id
#    version = "$Latest"
#  }
#}
#
#resource "aws_autoscaling_policy" "front_end_up" {
#  name                   = "front-end-asp-up"
#  scaling_adjustment     = 1
#  adjustment_type        = "ChangeInCapacity"
#  cooldown               = 300
#  autoscaling_group_name = aws_autoscaling_group.front_end.name
#}
#
#resource "aws_autoscaling_policy" "front_end_down" {
#  name                   = "front-end-asp-down"
#  scaling_adjustment     = -1
#  adjustment_type        = "ChangeInCapacity"
#  cooldown               = 300
#  autoscaling_group_name = aws_autoscaling_group.front_end.name
#}
#
#resource "aws_autoscaling_policy" "front_end" {
#  name                   = "front-end-asp"
#  autoscaling_group_name = aws_autoscaling_group.front_end.name
#
#  policy_type = "TargetTrackingScaling"
#
#  target_tracking_configuration {
#    predefined_metric_specification {
#      predefined_metric_type = "ASGAverageCPUUtilization"
#    }
#
#    target_value = 40.0
#  }
#}
