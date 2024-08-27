data "aws_ecr_repository" "flask_app" {
  name = var.mv_ecr_repository_name
}

resource "aws_ecs_cluster" "my_cluster" {
  name = var.mv_ecs_cluster_name
}

resource "aws_ecs_task_definition" "flask_app_task" {
    family                  = "flask-app-task" # group multiple versions
    # memory, cpu at container level
    # essential: if this container fails, the entire task will be stopped.
    container_definitions   = <<DEFINITION
    [
        {
        "name": "flask-app-task",
        "image": "${data.aws_ecr_repository.flask_app.repository_url}",
        "essential": true,
        "portMappings": [
            {
            "containerPort": 5000,
            "hostPort": 5000
            }
        ],
        "memory": 512, 
        "cpu": 256
        }
    ]
    DEFINITION 
    requires_compatibilities = ["FARGATE"]
    network_mode             = "awsvpc"
    # memory, cpu at task level
    memory                   = 512
    cpu                      = 256  
    execution_role_arn       = "${aws_iam_role.ecsTaskExecutionRole.arn}"
}

resource "aws_iam_role" "ecsTaskExecutionRole" {
    name = "ecsTaskExecutionRole"
    assume_role_policy = "${data.aws_iam_policy_document.assume_role_policy.json}"
}

# trust policy
data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

# attach permission policy
resource "aws_iam_role_policy_attachment" "ecsTaskExecutionRole_policy" {
  role       = "${aws_iam_role.ecsTaskExecutionRole.name}"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}