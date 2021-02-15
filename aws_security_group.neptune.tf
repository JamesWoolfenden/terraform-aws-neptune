resource "aws_security_group" "neptune" {
  vpc_id      = var.vpc_id
  description = "Manages Access to Neptune resources"

  ingress {
    description     = "neptune port"
    from_port       = 8182
    to_port         = 8182
    protocol        = "tcp"
    security_groups = var.security_groups
    cidr_blocks     = var.allowed_range
  }

  egress {
    description = "All outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

variable "allowed_range" {
  type        = list(any)
  description = "Cidrs that are allowed into Neptune"
}

variable "security_groups" {
  type        = list(any)
  description = "List of security group Group Names if using EC2-Classic, or Group IDs if using a VPC"
  default     = []
}
