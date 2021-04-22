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