#Admin team and repositories
resource "github_team" "lodestar_admins" {
  name        = "Admins"
  description = "Members with complete access to the project"
  create_default_maintainer = false
  privacy     = "closed"
}

resource "github_team_repository" "admin_lodestar_terraform" {
  team_id    = github_team.lodestar_admins.id
  repository = data.github_repository.lodestar_terraform.name
  permission = "admin"
}

resource "github_team_repository" "admin_lodestar_folder_app_example" {
  team_id    = github_team.lodestar_admins.id
  repository = data.github_repository.lodestar_folder_app_example.name
  permission = "admin"
}

resource "github_team_repository" "admin_lodestar" {
  team_id    = github_team.lodestar_admins.id
  repository = data.github_repository.lodestar.name
  permission = "admin"
}

#Tester team and repositories
resource "github_team" "lodestar_testers" {
  name        = "Testers"
  description = "Members who have access to the test repositories"
  create_default_maintainer = false
  privacy     = "closed"
}

resource "github_team_repository" "tester_lodestar_folder_app_example" {
  team_id    = github_team.lodestar_testers.id
  repository = data.github_repository.lodestar_folder_app_example.name
  permission = "push"
}