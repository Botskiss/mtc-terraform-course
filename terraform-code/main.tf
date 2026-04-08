data "github_user" "current" {
  username = ""
}

resource "github_repository" "mtc_repo" {
  for_each    = var.repos
  name        = "mtc-repo-${each.key}"
  description = "${each.value.lang} Code for MTC"
  visibility  = var.env == "dev" ? "private" : "public"
  auto_init   = true
  provisioner "local-exec" {
    command = "gh repo view ${self.name} --web"
  }

  provisioner "local-exec" {
    when    = destroy
    command = "rm -rf ${self.name}"
  }
}

resource "terraform_data" "repo-clone" {
  for_each   = var.repos
  depends_on = [github_repository_file.index, github_repository_file.readme]

  provisioner "local-exec" {
    command = "gh repo clone ${github_repository.mtc_repo[each.key].name}"
  }
}

resource "github_repository_file" "readme" {
  for_each            = var.repos
  repository          = github_repository.mtc_repo[each.key].name
  branch              = "main"
  file                = "README.md"
  content             = "# This a ${var.env} ${each.value.lang} repository is for ${each.key} developers. The infra was last modified by: ${data.github_user.current.name}"
  overwrite_on_create = true
}

resource "github_repository_file" "index" {
  for_each            = var.repos
  repository          = github_repository.mtc_repo[each.key].name
  branch              = "main"
  file                = each.value.filename
  content             = "# Hello ${each.value.lang}"
  overwrite_on_create = true
  lifecycle {
    ignore_changes = [
      content,
    ]
  }
}

output "clone-urls" {
  value       = { for i in github_repository.mtc_repo : i.name => [i.ssh_clone_url, i.http_clone_url] }
  description = "Repository Names and URL"
  sensitive   = false
}


