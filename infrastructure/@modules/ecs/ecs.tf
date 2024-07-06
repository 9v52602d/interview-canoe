resource "aws_ecs_cluster" "cluster" {
  name = "${var.env}-cluster"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

resource "aws_cloudwatch_log_group" "ecs_log_group" {
  name = "/ecs/${var.service_name}-container-${var.env}"
  retention_in_days = 7
}

resource "aws_ecs_task_definition" "main" {
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  family = "service"
  cpu                      = var.container_cpu
  memory                   = var.container_memory
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  task_role_arn            = aws_iam_role.ecs_task_role.arn
  container_definitions = jsonencode([{
    name        = "${var.service_name}-container-${var.env}"
    image       = "${var.repo_url}:${var.tag}"
    essential   = true
    environment = var.env
    portMappings = [{
      protocol      = "tcp"
      containerPort = var.container_port
      hostPort      = var.container_port
    }]
    logConfiguration = {
      logDriver = "awslogs"
      options= {
          awslogs-group= "/ecs/${var.service_name}-container-${var.env}"
          awslogs-region= var.aws_region
          awslogs-stream-prefix =  "ecs"
        }

    }
  }])
}

resource "aws_ecs_service" "main" {
  name                               = "${var.service_name}-service-${var.env}"
  cluster                            = aws_ecs_cluster.cluster.id
  task_definition                    = aws_ecs_task_definition.main.arn
  desired_count                      = var.desired_count
  deployment_minimum_healthy_percent = 50
  deployment_maximum_percent         = 100
  launch_type                        = "FARGATE"
  scheduling_strategy                = "REPLICA"

  network_configuration {
    security_groups  = [aws_security_group.sg_alb.id]
    subnets          = var.subnets_service
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = aws_alb_target_group.main.arn
    container_name   = "${var.service_name}-container-${var.env}"
    container_port   = var.container_port
  }
}