provider "aws" {
  region = "us-west-2"  # Change this to your desired AWS region
}

# Attempt to find the SQS queue (this will fail if it doesn't exist)
data "aws_sqs_queue" "existing_queue" {
  name = "my-queue-name"  # Replace with your desired queue name
}

# Create the SQS queue only if it doesn't exist (use count to check)
resource "aws_sqs_queue" "new_queue" {
  count = length(try(data.aws_sqs_queue.existing_queue.id, [])) == 0 ? 1 : 0

  name = "my-queue-name"  # Replace with your desired queue name
}
