remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket = "lodestar-terraform-state"
    key = "github/${path_relative_to_include()}/terraform.tfstate"
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
    github = {
      source = "integrations/github"
      version = "4.9.2"
    }
  }
}
EOF
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "github" {
    # Use GITHUB_TOKEN env variable
    # Use GITHUB_OWNER env variable
}
EOF
}