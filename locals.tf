locals {
  filesPath = "${path.module}/assets"
  files     = fileset(local.filesPath, "*")
}
