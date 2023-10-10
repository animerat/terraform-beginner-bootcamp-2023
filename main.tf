terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
#cloud {
#    organization = "anime-terraform"
#
#    workspaces {
#      name = "terra-house-anime"
#    }
#  }
}

provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token = var.terratowns_access_token
}
module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.teacherseat_user_uuid
  index_html_filepath = var.index_html_filepath
  error_html_filepath = var.error_html_filepath
  assets_path = var.assets_path
  content_version = var.content_version
}

resource "terratowns_home" "helloeworld_home" {
  name = "Hello World!"
  description = <<DESCRIPTION
Saying Hello World in Gaming
DESCRIPTION
  domain_name = module.terrahouse_aws.cloudfront_url
  #domain_name = "5gtanba2k.cloudfront.net"
  town = "missingo"
  content_version = 1
}