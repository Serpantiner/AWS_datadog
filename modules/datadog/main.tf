terraform {
  required_providers {
    datadog = {
      source  = "datadog/datadog"
      version = "~> 3.30.0"
    }
  }
}

resource "datadog_monitor" "cpu" {
  name    = "CPU Usage"
  type    = "metric alert"
  message = "CPU usage is high"

  query = "avg(last_5m):avg:system.cpu.user{*} by {host} > 80"

  monitor_thresholds {
    critical = 80
    warning  = 70
  }
}

resource "datadog_monitor" "memory" {
  name    = "Memory Usage"
  type    = "metric alert"
  message = "Memory usage is high"

  query = "avg(last_5m):avg:system.mem.used{*} by {host} > 80"

  monitor_thresholds {
    critical = 80
    warning  = 70
  }
}
