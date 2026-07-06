#terraform {
#  cloud {

#   organization = "botskiss-terraform"

#  workspaces {
#   name = "ecs"
# }
# }
#}

terraform {
  backend "s3" {
    bucket       = "mtc-botskiss-app-state21125"
    key          = "terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
  }
}

