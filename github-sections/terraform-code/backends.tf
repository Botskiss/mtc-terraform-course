# terraform {
#   backend "local" {
#     path = "../state/terraform.tfstate"
#   }
# }

terraform {
  #required_version = "1.15.1"

  cloud {

    organization = "botskiss-terraform"

    workspaces {
      name = "dev"
    }
  }
}
