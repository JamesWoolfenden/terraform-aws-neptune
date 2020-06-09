variable "common_tags" {
  description = "This is to help you add tags to your cloud objects"
  type        = map
}

variable "vpc_name_tag" {
  type    = string
  default = "*poc*"
}

variable "sub_private_tag" {
  type    = string
  default = "*private*"
}

variable "sub_public_tag" {
  type    = string
  default = "*public*"
}

variable "cluster" {
  description = "Neptune Cluster data"
  type        = map
}
