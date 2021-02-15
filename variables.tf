variable "common_tags" {
  description = "This is to help you add tags to your cloud objects"
  type        = map(any)
}


variable "cluster" {
  description = "Neptune Cluster data"
  type        = map(any)
}

variable "instance" {
  type = map(any)
  default = {
    count             = 2
    engine            = "neptune"
    instance_class    = "db.r4.large"
    apply_immediately = true
  }
}

variable "subnet_group_name" {
  default = "main"
}

variable "subnet_ids" {
  type = list(any)
}

variable "vpc_id" {
  type        = string
  description = "Security Group needs to know where to ne made"
}
