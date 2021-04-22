resource "github_repository" "lodestar_terraform" {
  name        = "lodestar-terraform"
  description = "Holds the Terraform and terragrunt files for Lodestar infrastructure"

  visibility = "public"
  has_issues = true
  allow_rebase_merge = false
  auto_init = true
}

resource "github_repository" "lodestar" {
  name        = "lodestar"
  description = "CLI code for the lodestar project"

  visibility = "public"
  has_issues = true
  allow_rebase_merge = false
  license_template = "lgpl-3.0" 
}

resource "github_repository" "lodestar_folder_app_example" {
  name        = "lodestar-folder-app-example"
  description = "Example of what an app that uses folders for environments would look like"

  visibility = "public"
  has_issues = true
  allow_rebase_merge = false
}
