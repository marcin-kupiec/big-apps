resource "aws_ecs_cluster" "main" {
  name = "bp-main"
}

resource "aws_ecs_service" "front-1" {
  name            = "front-1"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.front-1.arn
  desired_count   = 2
  iam_role        = aws_iam_role.ecs_agent.id

  #  network_configuration {
  #    security_groups = [aws_security_group.front_1_task.id]
  #    subnets         = data.aws_subnet_ids.private.ids
  #  }

  load_balancer {
    target_group_arn = aws_alb_target_group.front_end.id
    container_name   = "front-1"
    container_port   = 3000
  }

  depends_on = [aws_alb_listener.alb_front_end_listener]
}

data "aws_ami" "ecs" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn-ami-*-amazon-ecs-optimized"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}
