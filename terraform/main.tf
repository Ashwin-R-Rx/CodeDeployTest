provider "aws" {
  region = "us-east-1"  # Change this to your desired AWS region
}

# Check if the SQS queue already exists
data "aws_sqs_queue" "existing_queue" {
  name = "GitHubActionsQueue"  # Replace with the desired queue name
}

# If the queue does not exist, create a new one
resource "aws_sqs_queue" "new_queue" {
  count = length(data.aws_sqs_queue.existing_queue.id) == 0 ? 1 : 0

  name = "GitHubActionsQueue"  # Replace with your queue name
}
