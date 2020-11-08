resource "github_membership" "membership" {
  username = element(local.members, count.index)
  role     = "admin"
  count    = length(local.members)
}