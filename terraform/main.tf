provider "aws" {
  region = "us-east-1" # Replace with your preferred AWS region
}

variable "queue_name" {
  default = "GitHubActionsQueue"
}

resource "aws_sqs_queue" "example" {
  name                        = var.queue_name
  delay_seconds               = 0
  max_message_size            = 262144
  message_retention_seconds   = 10000
  visibility_timeout_seconds  = 30

  tags = {
    Environment = "Dev"
    Project     = "GitHubActionsExample"
  }
}

output "queue_url" {
  value = aws_sqs_queue.example.id
}
