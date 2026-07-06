# terraform {
#  cloud {

#   organization = "botskiss-terraform"

#  workspaces {
#   name = "ecs"
# }
# }
# }

terraform {
  backend "s3" {
    bucket       = ""
    key          = "terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
  }
}

