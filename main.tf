terraform {

  required_providers {

    aws = {

      source  = "hashicorp/aws"

      version = "~> 5.0"

    }

  }

}



provider "aws" {

  region = "us-east-1"

}



# This creates a simple S3 Bucket

resource "aws_s3_bucket" "my_gitops_bucket" {

  bucket = "gitops-project-bucket-${random_id.id.hex}"

# modification
tags = {
    Name        = "GitOps Test Bucket"
    Environment = "Dev"
    Project     = "Project-18"
    UpdateDate  = "2026-01-30" # Change this date to trigger the workflow
  }

}



resource "random_id" "id" {

  byte_length = 4

}
