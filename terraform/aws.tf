terraform {
  required_version = ">= 0.11"

  backend "s3" {
    bucket  = "my-tf-states-alice-website"
    key     = "terraform-delivery-pipeline"
    region  = "us-west-1"
  }
}

provider "aws" {
  alias = "main-region"
  region  = "us-west-1"
}

provider "aws" {
  alias = "secondary-region"
  region  = "us-east-1"
}

variable "key_name" {
  description = "Name of EC2 keypair to use"
  default     = "default"
}

data "aws_vpc" "default" {
  provider = "aws.main-region"
  default = true
}

