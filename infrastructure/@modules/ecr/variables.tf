variable "aws_region" {
  description = "The AWS region to create resources in"
  type        = string
  default     = "us-east-1"
}

variable "ecr_name" {
  type        = string
  description = "Canoe image name"
}