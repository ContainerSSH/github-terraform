resource "github_repository" "core" {
  name = "ContainerSSH"
  description = "ContainerSSH: Launch containers on demand"
  has_issues = true
  has_projects = false
  has_wiki = false
  has_downloads = true
  vulnerability_alerts = true
  default_branch = "stable"
  homepage_url = "https://containerssh.github.io/"

  allow_merge_commit = false
  allow_squash_merge = true
  allow_rebase_merge = false

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

//noinspection MissingProperty
resource "github_branch_protection" "core" {
  repository_id          = github_repository.core.id
  pattern                = "stable"
  enforce_admins         = true
  require_signed_commits = true
  required_status_checks {
    strict = true
    contexts = [
      "CodeQL",
      "Run lint",
      "Run tests",
    ]
  }
}