module "admins" {
  source = "../../modules/github_team"

  name = "Admins"
  description = "Users with admin access for all repositories"
  privacy = "closed"
  create_default_maintainer = false

  members = {
    rallinator7 = "maintainer"
    basemint    = "maintainer"
  }

  repositories = {
    lodestar-terraform          = "admin"
    lodestar                    = "admin"
    lodestar-folder-app-example = "admin"
  }
}

module "testers" {
  source = "../../modules/github_team"

  name = "Testers"
  description = "Users with write access to test repositories"
  privacy = "closed"
  create_default_maintainer = false

  members = {
    LodestarBot = "member"
  }

  repositories = {
    lodestar-folder-app-example = "push"
  }
}