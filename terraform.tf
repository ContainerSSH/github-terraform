resource "github_repository" "tf" {
  name                 = "github-terraform"
  description          = "Terraform repository for managing this GitHub organization"
  has_issues           = true
  has_projects         = false
  has_wiki             = false
  has_downloads        = false
  vulnerability_alerts = true
  default_branch       = "main"
  homepage_url         = "https://containerssh.io/"

  allow_merge_commit = false
  allow_squash_merge = true
  allow_rebase_merge = false

  delete_branch_on_merge = true

  topics = [
    "terraform",
    "infrastructure",
    "containerssh",
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
resource "github_branch_protection" "tf" {
  repository_id          = github_repository.tf.node_id
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
      "Terraform Cloud/ContainerSSH/github-terraform",
    ]
  }
}

resource "github_team_repository" "tf" {
  repository = github_repository.tf.id
  team_id    = github_team.developers.id
  permission = "push"
}