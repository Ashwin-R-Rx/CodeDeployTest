provider "aws" {
  region = "us-east-1"  # Specify your AWS region
}

resource "aws_sqs_queue" "my_queue" {
  name = "TerraformSQSQueue"
}

output "queue_url" {
  value = aws_sqs_queue.my_queue.url
}
