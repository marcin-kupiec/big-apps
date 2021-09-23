resource "aws_ecs_task_definition" "front-1" {
  family                = "front-1"
  container_definitions = file("container_definitions/front-1.json")
}
