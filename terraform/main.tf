provider "aws" {
  region = "us-east-1"  # Change to your desired AWS region
}

# Create the SQS queue, it will not duplicate if it already exists
resource "aws_sqs_queue" "queue" {
  name = "TerraformSQSQueue"  # Replace with your desired queue name

  # Ensure the queue will be created if it doesn't exist
  lifecycle {
    prevent_destroy = true  # Prevents accidental destruction of the queue
  }
}
