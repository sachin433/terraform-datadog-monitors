output "name" {
  value = [ for e in datadog_service_level_objective.slo-metric : e.name ]
}
