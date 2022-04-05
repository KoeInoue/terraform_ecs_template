resource "aws_ecs_cluster" "template-ecs-cluster" {
  name = "template-ecs-cluster" # ec2の環境変数とと同名にする
}

resource "aws_ecs_service" "template-service" {
  name            = "template-service"
  cluster         = aws_ecs_cluster.template-ecs-cluster.id
  task_definition = aws_ecs_task_definition.template-task.arn
  desired_count   = 1
  launch_type     = "EC2"
}

resource "aws_ecs_task_definition" "template-task" {
  family                = "template-service"
  container_definitions = file("./service/task_difinitions.json")
  task_role_arn         = aws_iam_role.ecs_task_role.arn
  network_mode          = "bridge"
}
