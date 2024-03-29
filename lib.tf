resource "github_repository" "lib" {
  name                 = "libcontainerssh"
  description          = "Embedded ContainerSSH and webhook helper library"
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

  delete_branch_on_merge = true

  topics = [
    "docker",
    "kubernetes",
    "ssh",
    "devsecops",
    "security",
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

resource "github_team_repository" "lib" {
  repository = github_repository.lib.name
  team_id    = github_team.chairs.id
  permission = "admin"
}

//noinspection MissingProperty
resource "github_branch_protection" "lib" {
  repository_id          = github_repository.lib.node_id
  pattern                = "main"
  enforce_admins         = false
  require_signed_commits = false
  required_pull_request_reviews {
    dismiss_stale_reviews           = true
    required_approving_review_count = 1
  }
  required_status_checks {
    strict = true
    contexts = [
      "golangci-lint",
      "go test",
    ]
  }
  push_restrictions = [
    github_team.chairs.node_id,
    github_team.bots.node_id,
  ]
}