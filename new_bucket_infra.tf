# Specify the provider and access details

provider "aws" {
  region = "us-east-1"
}

# Configure Terraform backend to store state remotely
terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  
  backend "s3" {
    bucket = "website-artifacts-tommy"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

# Create an S3 bucket
resource "aws_s3_bucket" "udabucket-tomm" {
  bucket = "cicd-terraform-demo-bucket20213-tommy"

  tags = {
    Name        = "CICD test bucket"
    Environment = "Dev"
  }
}

# Create an EC2 instance
resource "aws_instance" "ec2_instance" {
  ami           = "ami-04a0ae173da5807d3"
  instance_type = "t2.micro"

  tags = {
    Name = "CICD test instance"
  }
}

