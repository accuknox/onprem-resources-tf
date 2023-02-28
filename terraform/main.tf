provider "aws" {
  region                      = var.region
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
}


provider "vault" {
  skip_child_token = true
}

data "aws_availability_zones" "available" {}

locals {
  cluster_name = var.cluster_name
}
