include {
  path = find_in_parent_folders()
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
    sops = {
      source = "carlpett/sops"
      version = "0.6.2"
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

provider "sops"{}
EOF
}