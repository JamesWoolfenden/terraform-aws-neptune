#tfsec:ignore:aws-ec2-no-public-egress-sgr
resource "aws_security_group" "neptune" {
  vpc_id      = var.vpc_id
  description = "Manages Access to Neptune resources"

  ingress {
    description     = "neptune port"
    from_port       = var.port
    to_port         = var.port
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

  tags = var.common_tags
}
