resource "github_repository" "lodestar_terraform" {
  name        = "lodestar-terraform"
  description = "Holds the Terraform and terragrunt files for Lodestar infrastructure"

  visibility = "public"
  has_issues = true
  allow_rebase_merge = false
  auto_init = true

}