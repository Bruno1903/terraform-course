terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.58.0"
    }
  }

  backend "s3" {
    bucket = "brunoalmeida-remote-state-practice"
    key    = "aws-vm/terraform.tfstate"
    region = "sa-east-1"
  }

}

provider "aws" {
  region = "sa-east-1"
  default_tags {
    tags = {
      owner      = "brunoalmeida"
      managed-by = "terraform"
    }
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "brunoalmeida-remote-state-practice"
    key    = "aws-vpc/terraform.tfstate"
    region = "sa-east-1"
  }
}

