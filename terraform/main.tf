provider "aws" {
  region = "us-east-1"  # Specify your AWS region
}

resource "aws_sqs_queue" "my_queue" {
  name = "TerraformSQSQueue"
}

resource "aws_sqs_queue_message" "my_message" {
  queue_url = aws_sqs_queue.my_queue.url
  message_body = "Terraform SQSQueue Message!"
}

output "queue_url" {
  value = aws_sqs_queue.my_queue.url
}

output "message_id" {
  value = aws_sqs_queue_message.my_message.message_id
}
