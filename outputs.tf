output "instances" {
  value = aws_neptune_cluster_instance.example
}

output "cluster" {
  value = aws_neptune_cluster.default
}

output "subnet" {
  value = aws_neptune_subnet_group.default
}
