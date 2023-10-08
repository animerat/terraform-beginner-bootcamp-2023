terraform {
#cloud {
#    organization = "anime-terraform"
#
#    workspaces {
#      name = "terra-house-anime"
#    }
#  }
required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.16.2"
    }
  }
}

provider "aws" {
}
