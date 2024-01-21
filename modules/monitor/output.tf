output "name" {
  value = [ for e in datadog_monitor.Monitor : e.name ]
}


