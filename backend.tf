terraform {
  backend "s3" {
    #bucket name
    bucket = ""
    key    = "s3/terraform.tfstate"
    region = "us-east-1"
  }
}
