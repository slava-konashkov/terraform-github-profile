resource "github_repository" "profile" {
  name            = var.github_username
  visibility      = "public"
  has_wiki        = false
  has_issues      = false
  has_discussions = false
  has_downloads   = false
  has_projects    = false
}

resource "github_repository_file" "profile_files" {
  for_each            = local.files
  repository          = github_repository.profile.name
  content             = file("${local.filesPath}/${each.value}")
  file                = each.key
  overwrite_on_create = true
}
