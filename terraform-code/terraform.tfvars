repo_max = 4
#varsource  = "terraform.tfvars"
env = "dev"
repos = {
  infra = {
    lang     = "terraform",
    filename = "main.tf"
  },
  backend = {
    lang     = "python",
    filename = "main.py"
  }
}

