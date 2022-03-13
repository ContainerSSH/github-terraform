resource "github_repository" "core" {
  name                 = "ContainerSSH"
  description          = "ContainerSSH: Launch containers on demand"
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
  repository_id          = github_repository.core.node_id
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
      "Build",
    ]
  }
}

resource "github_actions_secret" "core" {
  repository      = github_repository.core.name
  secret_name     = "GPG_KEY"
  plaintext_value = replace(replace(base64encode(var.gpg_code_signing_key), "\n", ""), "\r", "")
}

resource "github_actions_secret" "core-github-username" {
  repository      = github_repository.core.name
  secret_name     = "GH_USERNAME"
  plaintext_value = var.organization
}

resource "github_team_repository" "core" {
  repository = github_repository.core.id
  team_id    = github_team.developers.id
  permission = "push"
}
