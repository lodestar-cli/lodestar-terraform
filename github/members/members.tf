# LodestarBot membership and teams
resource "github_membership" "lodestar_bot" {
  username = "LodestarBot"
  role     = "member"
}

resource "github_team_membership" "lb_team_membership" {
  team_id  = data.github_team.testers.id
  username = github_membership.lodestar_bot.username
  role     = "member"
}

# rallinator7 membership and teams
resource "github_membership" "rallinator7" {
  username = "rallinator7"
  role     = "admin"
}

resource "github_team_membership" "some_team_membership" {
  team_id  = data.github_team.admins.id
  username = github_membership.rallinator7.username
  role     = "maintainer"
}