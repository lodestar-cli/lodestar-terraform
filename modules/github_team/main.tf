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

provider "github" {
    # Use GITHUB_TOKEN env variable
    # Use GITHUB_OWNER env variable
}
