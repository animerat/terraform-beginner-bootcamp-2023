terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
cloud {
    organization = "anime-terraform"

    workspaces {
      name = "terra-house-anime"
    }
  }
}

provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token = var.terratowns_access_token
}
module "home_helloworld_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.helloworld.public_path
  content_version = var.helloworld.content_version
}

resource "terratowns_home" "helloeworld_home" {
  name = "Hello World!"
  description = <<DESCRIPTION
Saying Hello World in Gaming
DESCRIPTION
  domain_name = module.home_helloworld_hosting.domain_name
  #domain_name = "5gtanba2k.cloudfront.net"
  town = "missingo"
  content_version = var.helloworld.content_version
}

module "home_okonomiyaki_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.okonomiyaki.public_path
  content_version = var.okonomiyaki.content_version
}

resource "terratowns_home" "home_okonomiyaki" {
  name = "Different types of Okonomiyaki"
  description = <<DESCRIPTION
Since we are talking about making an anything go house, how about an Okonomiyaki.
The word "okonomiyaki" is derived from "okonomi" meaning "as you like" and "yaki" 
meaning "grilled.  It's commonly referred to as being a Japanese pancake. Accurate 
to its name, okonomiyaki can be served with a variety of toppings which include 
everything from meat and seafood to vegetables and cheese.
DESCRIPTION
  domain_name = module.home_okonomiyaki_hosting.domain_name
  #domain_name = "5gtanba2k.cloudfront.net"
  town = "missingo"
  content_version = var.okonomiyaki.content_version
}