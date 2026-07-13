terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

    docker = {
      source  = "docker/docker"
      version = "~> 0.6.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      App       = "mtc-app"
      workspace = terraform.workspace
    }
  }
}

provider "docker" {
  # Configuration options
}