resource "github_repository" "images" {
  name                 = "images"
  description          = "The ContainerSSH container images"
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

resource "github_team_repository" "images" {
  repository = github_repository.images.name
  team_id    = github_team.chairs.id
  permission = "admin"
}

//noinspection MissingProperty
resource "github_branch_protection" "images" {
  repository_id          = github_repository.images.node_id
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

resource "github_actions_secret" "images-docker-username" {
  repository      = github_repository.images.name
  secret_name     = "DOCKER_USERNAME"
  plaintext_value = var.docker_username
}

resource "github_actions_secret" "images-docker-password" {
  repository      = github_repository.images.name
  secret_name     = "DOCKER_PASSWORD"
  plaintext_value = var.docker_password
}

resource "github_actions_secret" "images-quay-username" {
  repository      = github_repository.images.name
  secret_name     = "QUAY_USERNAME"
  plaintext_value = var.quay_username
}

resource "github_actions_secret" "images-quay-password" {
  repository      = github_repository.images.name
  secret_name     = "QUAY_PASSWORD"
  plaintext_value = var.quay_password
}

resource "github_actions_secret" "images-github-username" {
  repository      = github_repository.images.name
  secret_name     = "GH_USERNAME"
  plaintext_value = var.organization
}