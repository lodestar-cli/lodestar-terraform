resource "github_team" "team" {
  name                      = var.name
  description               = var.description
  privacy                   = var.privacy
  parent_team_id            = var.parent_team_id
  ldap_dn                   = var.ldap_dn
  create_default_maintainer = var.create_default_maintainer
}

resource "github_team_membership" "team_membership" {
  for_each = var.members
  team_id  = github_team.team.id
  username = each.key
  role     = each.value
}

resource "github_team_repository" "admin_lodestar_folder_app_example" {
  for_each   = var.repositories
  team_id    = github_team.team.id
  repository = each.key
  permission = each.value
}