resource "github_repository" "profile" {
  name = var.github_username

  visibility = "public"

  has_wiki = false
}

locals {
  files = toset([
    "README.MD",
  ])
}

resource "github_repository_file" "profile_files" {
  for_each = local.files
  repository = github_repository.profile.name
  content = each.key
  file = each.key
}