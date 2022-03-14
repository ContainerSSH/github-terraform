resource "github_repository" "configurator" {
  name                 = "configurator"
  description          = "Web configurator for ContainerSSH"
  has_issues           = true
  has_projects         = false
  has_wiki             = false
  has_downloads        = true
  vulnerability_alerts = true
  default_branch       = "main"
  homepage_url         = "https://configurator.containerssh.io/"

  allow_merge_commit = false
  allow_squash_merge = true
  allow_rebase_merge = true
  allow_auto_merge   = true

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

resource "github_team_repository" "configurator" {
  repository = github_repository.configurator.id
  team_id    = github_team.developers.id
  permission = "push"
}

//noinspection MissingProperty
resource "github_branch_protection" "configurator" {
  repository_id          = github_repository.configurator.node_id
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
      "CodeQL",
      "Run lint",
      "Release",
    ]
  }
}