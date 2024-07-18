output "ec2_instance_ip" {
  value = aws_instance.main.public_ip
}

output "k8s_node_ips" {
  value = aws_instance.k8s_nodes[*].public_ip
}

output "ecr_repository_url" {
  value = aws_ecr_repository.main.repository_url
}

output "s3_bucket_name" {
  value = aws_s3_bucket.main.id
}

output "cpu_monitor_id" {
  value = datadog_monitor.cpu.id
}

output "memory_monitor_id" {
  value = datadog_monitor.memory.id
}