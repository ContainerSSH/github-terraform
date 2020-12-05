resource "github_repository" "website" {
  name = "containerssh.github.io"
  description = "The ContainerSSH website"
  has_issues = true
  has_projects = false
  has_wiki = false
  has_downloads = false
  vulnerability_alerts = true
  default_branch = "main"
  homepage_url = "https://containerssh.github.io/"

  allow_merge_commit = false
  allow_squash_merge = true
  allow_rebase_merge = false

  topics = [
    "containerssh",
    "infrastructure",
    "mkdocs",
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
resource "github_branch_protection" "website" {
  repository_id          = github_repository.website.node_id
  pattern                = "main"
  enforce_admins         = true
  require_signed_commits = true
  required_status_checks {
    strict = true
    contexts = []
  }
}