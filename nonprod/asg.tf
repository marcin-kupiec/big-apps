resource "aws_launch_configuration" "ecs_launch_config" {
  image_id             = data.aws_ami.ecs.id
  iam_instance_profile = aws_iam_instance_profile.ecs_agent.name
  security_groups      = [aws_security_group.public_http.id]
  user_data            = "#!/bin/bash\necho ECS_CLUSTER=bp-main >> /etc/ecs/ecs.config"
  instance_type        = "t2.micro"
  key_name             = aws_key_pair.access_key.key_name
}

resource "aws_autoscaling_group" "front-1" {
  name                 = "front-1"
  vpc_zone_identifier  = data.aws_subnet_ids.public.ids
  launch_configuration = aws_launch_configuration.ecs_launch_config.name

  desired_capacity          = 2
  min_size                  = 1
  max_size                  = 10
  health_check_grace_period = 300
  health_check_type         = "EC2"
}
