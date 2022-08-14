terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "${var.aws_region}"
  #shared_credentials_files = "$HOME/.aws/credentials"
  profile                 = "default"
  
}

# Create a VPC
resource "aws_vpc" "example" {
  cidr_block = "${var.vpc_cidr}"

  tags = {
    Name = "${var.envi}_${var.aws_region}"
  }
}

terraform {
  backend "s3" {
    bucket = "terraform-backend-testt"
    key    = "terraform.state"
    region = "ap-south-1"
  }
} 
