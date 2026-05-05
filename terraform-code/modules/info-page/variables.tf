variable "repos" {
  type = map(any)
}

variable "run_provisioners" {
  type    = bool
  default = false
}