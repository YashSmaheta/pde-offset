variable "project_id" {}
variable "region"     {}
variable "policies" {
  type = map(object({
    path        = string
    constraint  = string
  }))
}
