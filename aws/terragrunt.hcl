remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket = "lodestar-terraform-state"
    key = "aws/${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-2"
  }
}

generate "main" {
  path = "main.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
terraform {
  required_version = ">= 0.14"

  required_providers {
    random   = "~> 2.1"
    local    = "~> 1.2"
    null     = "~> 2.1"
    template = "~> 2.1"
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.22.0"
    }
  }
}
EOF
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "aws" {
  region  = "us-east-2"
}
EOF
}