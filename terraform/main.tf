provider "aws" {
  region                      = var.region
}


provider "vault" {
  skip_child_token = true
}

data "aws_availability_zones" "available" {}

locals {
  cluster_name = var.cluster_name
}
