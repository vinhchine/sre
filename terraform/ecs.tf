resource "aws_ecs_cluster" "cluster" {
  name = "app-cluster"
}

resource "aws_ecs_task_definition" "task" {
  family                   = "app-task"
  requires_compatibilities = ["FARGATE"]
  cpu    = "256"
  memory = "512"
  execution_role_arn = "arn:aws:iam::668764275271:role/ecsTaskExecutionRole"
  network_mode = "awsvpc"

  container_definitions = jsonencode([
    {
      name  = "app"
      image = var.image
      portMappings = [
        {
          containerPort = 5000
        }
      ]
    }
  ])
}

resource "aws_ecs_service" "service" {
  name            = "app-service"
  cluster         = aws_ecs_cluster.cluster.id
  task_definition = aws_ecs_task_definition.task.arn
  desired_count   = 1

  launch_type = "FARGATE"

  network_configuration {
    subnets = [
      aws_subnet.subnet_1.id,
      aws_subnet.subnet_2.id
    ]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.tg.arn
    container_name   = "app"
    container_port   = 5000
  }
}