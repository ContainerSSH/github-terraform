resource "github_repository" "go" {
  name                 = "go.containerssh.io"
  description          = "The ContainerSSH Go package redirector"
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
  ]

  pages {
    cname = "go.containerssh.io"
    source {
      branch = "gh-pages"
      path   = "/"
    }
  }

  lifecycle {
    ignore_changes = [
      template,
      has_downloads,
      topics,
    ]
    prevent_destroy = true
  }
}

//noinspection MissingProperty
resource "github_branch_protection" "go" {
  repository_id          = github_repository.go.node_id
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
}

resource "github_team_repository" "go-devs" {
  repository = github_repository.go.id
  team_id    = github_team.developers.id
  permission = "push"
}

