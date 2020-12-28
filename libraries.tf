resource "github_repository" "library" {
  name                 = each.key
  description          = each.value
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
  archived = contains(local.libraries, each.key)
  topics = [
    "library",
    "containerssh",
  ]

  template {
    owner      = "ContainerSSH"
    repository = "library-template"
  }
  lifecycle {
    ignore_changes = [
      template,
      has_downloads,
      topics,
    ]
  }

  for_each = local.libraries
}

//noinspection MissingProperty
resource "github_branch_protection" "library" {
  repository_id          = each.value.node_id
  pattern                = "main"
  enforce_admins         = false
  require_signed_commits = true
  required_pull_request_reviews {
    dismiss_stale_reviews           = true
    required_approving_review_count = 1
  }
  required_status_checks {
    strict = true
    contexts = [
      "CodeQL",
      "Run lint",
      "Run tests",
    ]
  }
  for_each = github_repository.library
}

resource "github_issue_label" "bug" {
  color       = "d73a4a"
  name        = "bug"
  description = "Something isn't working"
  repository  = each.value.name
  for_each    = github_repository.library
}

resource "github_issue_label" "cleanup" {
  color       = "d1c02e"
  name        = "cleanup"
  description = "Make the code more beautiful or add a build tool"
  repository  = each.value.name
  for_each    = github_repository.library
}

resource "github_issue_label" "enhancement" {
  color       = "4d53c6"
  name        = "enhancement"
  description = "New feature or request"
  repository  = each.value.name
  for_each    = github_repository.library
}

resource "github_issue_label" "help_wanted" {
  color       = "008672"
  name        = "help wanted"
  description = "Extra attention is needed"
  repository  = each.value.name
  for_each    = github_repository.library
}

resource "github_issue_label" "support" {
  color       = "d876e3"
  name        = "question"
  description = "Ask a question"
  repository  = each.value.name
  for_each    = github_repository.library
}

resource "github_issue_label" "upstream" {
  color       = "ffb566"
  name        = "upstream"
  description = "Issue with an upstream library"
  repository  = each.value.name
  for_each    = github_repository.library
}

resource "github_issue_label" "documentation" {
  color       = "0075ca"
  name        = "documentation"
  description = "Improvements or additions to documentation"
  repository  = each.value.name
  for_each    = github_repository.library
}