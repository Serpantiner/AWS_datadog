output "cpu_monitor_id" {
  value = datadog_monitor.cpu.id
}

output "memory_monitor_id" {
  value = datadog_monitor.memory.id
}
