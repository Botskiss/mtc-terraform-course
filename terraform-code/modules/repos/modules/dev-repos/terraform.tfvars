repo_max = 4
env      = "prod"
repos = {
  infra = {
    lang     = "terraform",
    filename = "main.tf"
    pages    = true
  },
  backend = {
    lang     = "python",
    filename = "main.py"
    pages    = false
  }
}

