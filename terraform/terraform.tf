terraform {
  cloud {
    organization = "PlaySquareOff"

    workspaces {
      name = "docker-playwright-lambda"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
