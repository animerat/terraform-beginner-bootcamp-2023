terraform {
#cloud {
#    organization = "anime-terraform"
#
#    workspaces {
#      name = "terra-house-anime"
#    }
#  }
}

module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
}