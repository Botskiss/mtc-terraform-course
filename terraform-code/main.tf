
resource "github_repository" "mtc_repo" {
  //count       = var.repo_count
  name        = "mtc-repo"
  description = "Code for MTC"
  visibility  = "private"
  auto_init   = true
}
