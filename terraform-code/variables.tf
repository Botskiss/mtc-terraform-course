variable "repo_count" {
  type        = number
  description = "Number or repositories."
  default     = 1

  validation {
    condition     = var.repo_count < 5
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

