# https://learn.hashicorp.com/tutorials/terraform/aws-remote?in=terraform/aws-get-started
terraform {
  required_version = ">=1.1.5"
  backend "s3" {
    bucket  = "template-terraform-state"
    region  = "ap-northeast-1"
    key     = "terraform.tfstate"
    encrypt = true
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs
provider "aws" {
  region = "ap-northeast-1"
}
