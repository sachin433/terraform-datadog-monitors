
output "scope" {
  value = [ for e in datadog_downtime.downtime : e.message ]
}

output "tags" {
  value = [ for e in datadog_metric_tag_configuration.custom_metric_tag : e.metric_name ]
} 


output "metadata" {
  value = [ for e in datadog_metric_metadata.custom_metric_metadata : e.metric ]
}
