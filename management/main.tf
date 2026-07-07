terraform {
  cloud {

    organization = "botskiss-terraform"

    workspaces {
      name = "state-buckets"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

locals {
  buckets = {
    "dev"  = "mtc-botskiss-app-state21125"
    "prod" = "mtc-botskiss-app-state21126"
  }
}

# import {
#   for_each = local.buckets
#   to       = aws_s3_bucket.this[each.key]
#   id       = each.value
# }

resource "aws_s3_bucket" "this" {
  for_each = local.buckets
  force_destroy = true
}

