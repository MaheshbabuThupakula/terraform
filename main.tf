provider "aws" {
  region = "ap-south-1"  # Replace with your desired AWS region
}

resource "aws_ecs_cluster" "example" {
  name = "my-ecs-cluster"
}

resource "aws_ecs_task_definition" "example" {
  family                   = "nginx-task"
  container_definitions    = <<DEFINITION
    [
      {
        "name": "nginx",
        "image": "nginx:latest",
        "portMappings": [
          {
            "containerPort": 80,
            "hostPort": 80,
            "protocol": "tcp"
          }
        ],
        "essential": true
      }
    ]
  DEFINITION
  cpu                      = "256"
  memory                   = "512"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
}

resource "aws_ecs_service" "example" {
  name            = "nginx-service"
  cluster         = aws_ecs_cluster.example.id
  task_definition = aws_ecs_task_definition.example.arn
  desired_count   = 1

  launch_type = "FARGATE"

  network_configuration {
    subnets         = ["subnet-062e918b4896bac4f"]  # Replace with your desired subnet IDs
    security_groups = ["sg-022191a90372196c5"]     # Replace with your desired security group IDs
    assign_public_ip = "true"
  }
}
