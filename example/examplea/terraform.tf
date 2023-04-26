terraform {
  required_providers {
    aws = {
      version = "4.62.0"
      source  = "hashicorp/aws"
    }
    local = {
      version = "2.2.3"
      source  = "hashicorp/local"
    }
  }
  required_version = ">= 1.3.0"
}
