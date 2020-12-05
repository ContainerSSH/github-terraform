resource "github_repository" "branding" {
  name = "branding"
  description = "ContainerSSH icons, logos"
  has_issues = true
  has_projects = false
  has_wiki = false
  has_downloads = true
  vulnerability_alerts = true
  default_branch = "main"
  homepage_url = "https://containerssh.github.io/"

  allow_merge_commit = false
  allow_squash_merge = true
  allow_rebase_merge = false

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

//noinspection MissingProperty
resource "github_branch_protection" "branding" {
  repository_id          = github_repository.branding.node_id
  pattern                = "main"
  enforce_admins         = true
  require_signed_commits = true
}