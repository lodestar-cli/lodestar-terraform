data "github_actions_public_key" "lodestar_public_key" {
  repository = "lodestar"
}

data "sops_file" "github_actions_sops_secrets" {
  source_file = "github-actions-sops-secrets.enc.yaml"
}

resource "github_actions_secret" "aws_access_key_id" {
  repository       = "lodestar"
  secret_name      = "AWS_ACCESS_KEY_ID"
  plaintext_value  = data.sops_file.github_actions_sops_secrets.data["aws-access-key-id"]
}

resource "github_actions_secret" "aws_access_key_secret" {
  repository       = "lodestar"
  secret_name      = "AWS_ACCESS_KEY_SECRET"
  plaintext_value  = data.sops_file.github_actions_sops_secrets.data["aws-access-key-secret"]
}

resource "github_actions_secret" "docker_username" {
  repository       = "lodestar"
  secret_name      = "DOCKER_HUB_USERNAME"
  plaintext_value  = data.sops_file.github_actions_sops_secrets.data["docker-hub-username"]
}

resource "github_actions_secret" "docker_access_token" {
  repository       = "lodestar"
  secret_name      = "DOCKER_HUB_ACCESS_TOKEN"
  plaintext_value  = data.sops_file.github_actions_sops_secrets.data["docker-hub-access-token"]
}

resource "github_actions_secret" "github_username" {
  repository       = "lodestar"
  secret_name      = "GIT_USER"
  plaintext_value  = data.sops_file.github_actions_sops_secrets.data["github-username"]
}

resource "github_actions_secret" "github_access_token" {
  repository       = "lodestar"
  secret_name      = "GIT_TOKEN"
  plaintext_value  = data.sops_file.github_actions_sops_secrets.data["github-token"]
}