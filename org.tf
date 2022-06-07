resource "github_membership" "membership" {
  username = element(local.admins, count.index)
  role     = "admin"
  count    = length(local.admins)
}

resource "github_membership" "members" {
  username = element(local.members, count.index)
  role     = "member"
  count    = length(local.members)
}

resource "github_team" "bots" {
  name        = "bots"
  description = "The ContainerSSH bots"
  privacy     = "secret"
}

resource "github_team" "chairs" {
  name        = "chairs"
  description = "The ContainerSSH project chairs"
  privacy     = "closed"
}

resource "github_team_members" "chairs" {
  team_id  = github_team.chairs.id

  dynamic "members" {
    for_each = local.chairs
    content {
      username = members.value
      role     = "maintainer"
    }
  }
}

resource "github_team_members" "bots" {
  team_id  = github_team.bots.id

  dynamic "members" {
    for_each = local.bots
    content {
      username = members.value
      role     = "maintainer"
    }
  }
}
