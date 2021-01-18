terraform {
  required_providers {
    aws = {
      version = "3.24.1"
      source  = "hashicorp/aws"
    }
    local = {
      version = "2.0.0"
      source  = "hashicorp/local"
    }
  }
}
