resource "github_repository" "branding" {
  name                 = "branding"
  description          = "ContainerSSH icons, logos"
  has_issues           = true
  has_projects         = false
  has_wiki             = false
  has_downloads        = true
  vulnerability_alerts = true
  default_branch       = "main"
  homepage_url         = "https://containerssh.io/"

  allow_merge_commit = false
  allow_squash_merge = true
  allow_rebase_merge = true
  allow_auto_merge   = true

  delete_branch_on_merge = true

  topics = [
    "svg",
    "infrastructure",
    "logos",
    "containerssh",
  ]

  lifecycle {
    ignore_changes = [
      template,
      has_downloads,
      topics,
    ]
  }
}

resource "github_team_repository" "branding" {
  repository = github_repository.branding.name
  team_id    = github_team.chairs.id
  permission = "admin"
}

//noinspection MissingProperty
resource "github_branch_protection" "branding" {
  repository_id          = github_repository.branding.node_id
  pattern                = "main"
  enforce_admins         = false
  require_signed_commits = false
  required_pull_request_reviews {
    dismiss_stale_reviews           = true
    required_approving_review_count = 1
  }
  push_restrictions = [
    github_team.chairs.node_id,
    github_team.bots.node_id,
  ]
}