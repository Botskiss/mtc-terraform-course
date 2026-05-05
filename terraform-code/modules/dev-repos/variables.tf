variable "repo_max" {
  type        = number
  description = "Number or repositories."
  default     = 2

  validation {
    condition     = var.repo_max <= 10
    error_message = "Do no deploy more than 5 repositories."
  }

}

variable "env" {
  type        = string
  description = "Deployment environment"
  validation {
    condition     = contains(["dev", "prod"], var.env)
    error_message = "Env must be 'dev' or 'prod'"
  }
}

variable "repos" {
  type        = map(map(string))
  description = "Repositories"
  validation {
    condition     = length(var.repos) <= var.repo_max
    error_message = "Please do not deploy more than the maximum allowed."
  }
}

variable "run_provisioners" {
  type    = bool
  default = false
}




# Will procduce an error!
# variable "visibility" {
#   type = string
#   description = "Visibility of the repo."
#   default = var.env == "dev" ? "private" : "public"
# }




# variable "varsource" {
#   type        = string
#   description = "Source used to define variables."
#   default     = "variables.tf"
# }

