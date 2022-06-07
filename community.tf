resource "github_repository" "community" {
  name                 = "community"
  description          = "ContainerSSH community documentation"
  has_issues           = true
  has_projects         = false
  has_wiki             = false
  has_downloads        = false
  vulnerability_alerts = true
  default_branch       = "main"
  homepage_url         = "https://containerssh.io/"

  allow_merge_commit = false
  allow_squash_merge = true
  allow_rebase_merge = true
  allow_auto_merge   = true

  delete_branch_on_merge = true

  topics = [
    "containerssh",
    "infrastructure",
    "community",
  ]

  lifecycle {
    ignore_changes = [
      template,
      has_downloads,
      topics,
    ]
    prevent_destroy = true
  }
}

resource "github_branch_protection" "community" {
  repository_id          = github_repository.community.node_id
  pattern                = "main"
  enforce_admins         = true
  require_signed_commits = false
  required_pull_request_reviews {
    dismiss_stale_reviews           = true
    required_approving_review_count = 2
  }
  required_status_checks {
    strict   = true
    contexts = []
  }
  push_restrictions = [
    github_team.chairs.node_id,
    github_team.bots.node_id,
  ]
}

resource "github_repository" "github" {
  name                 = ".github"
  description          = "ContainerSSH organization-wide repository"
  has_issues           = true
  has_projects         = false
  has_wiki             = false
  has_downloads        = false
  vulnerability_alerts = true
  default_branch       = "main"
  homepage_url         = "https://containerssh.io/"

  allow_merge_commit = false
  allow_squash_merge = true
  allow_rebase_merge = true
  allow_auto_merge   = true

  delete_branch_on_merge = true

  topics = [
    "containerssh",
    "infrastructure",
    "community",
  ]

  lifecycle {
    ignore_changes = [
      template,
      has_downloads,
      topics,
    ]
    prevent_destroy = true
  }
}

resource "github_branch_protection" "github" {
  repository_id          = github_repository.github.node_id
  pattern                = "main"
  enforce_admins         = false
  require_signed_commits = false
  required_pull_request_reviews {
    dismiss_stale_reviews           = true
    required_approving_review_count = 1
  }
  required_status_checks {
    strict   = true
    contexts = []
  }
  push_restrictions = [
    github_team.chairs.node_id,
    github_team.bots.node_id,
  ]
}
