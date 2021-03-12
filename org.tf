resource "github_membership" "membership" {
  username = element(local.members, count.index)
  role     = "admin"
  count    = length(local.members)
}

resource "github_team" "support" {
  name        = "support"
  description = "The ContainerSSH Support Team"
  privacy     = "closed"
}

resource "github_team" "developers" {
  name        = "developers"
  description = "The ContainerSSH Dev Team"
  privacy     = "closed"
}

resource "github_team" "website" {
  name        = "website"
  description = "The ContainerSSH Website Team"
  privacy     = "closed"
}

resource "github_team_membership" "support" {
  team_id  = github_team.support.id
  username = element(local.support, count.index)
  count    = length(local.support)
}

resource "github_team_membership" "developers" {
  team_id  = github_team.developers.id
  username = element(local.developers, count.index)
  count    = length(local.developers)
}

resource "github_team_membership" "website" {
  team_id  = github_team.website.id
  username = element(local.website, count.index)
  count    = length(local.website)
}