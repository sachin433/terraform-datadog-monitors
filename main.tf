#Creates datadog montiors
module "monitor" {
   source = "../modules/monitor"
   dd_properties = var.dd_properties
   env  = var.env
   datadog_app_key = var.datadog_app_key
   datadog_api_key = var.datadog_api_key
   
}

#Creates datadog slos
module "metric-slo" {
   source = "../modules/metric-slo"
   slo_configs = var.slo_configs
   
   datadog_app_key = var.datadog_app_key
   datadog_api_key = var.datadog_api_key

}

#Creates datadog downtimes
resource "datadog_downtime" "downtime" {
  for_each = { for e in var.dd_downtime : e.message => e }
  scope      = lookup (each.value, "scope")
  monitor_id = lookup (each.value, "monitor_id")
  message = lookup (each.value, "message")

}

#Configures datadog custom metrics
resource "datadog_metric_tag_configuration" "custom_metric_tag" {
  for_each = { for e in var.dd_tags : e.metric_name => e }
  metric_name         =  lookup (each.value, "metric_name")
  metric_type         =  lookup (each.value, "metric_type")
  tags                =  lookup (each.value, "metric_tags")
  include_percentiles =  lookup (each.value, "include_percentiles") 
}

resource "datadog_metric_metadata" "custom_metric_metadata" {
  for_each = { for e in var.dd_metadata : e.metric => e }
  metric      = lookup (each.value, "metric")
  unit        = lookup (each.value, "unit")
  type        = lookup (each.value, "type")
}

#Creates datadog log indexes
resource "datadog_logs_index" "logs_index" {
for_each = var.log_indexes
name = each.key
#id   = each.value["name"]
disable_daily_limit = false
daily_limit = each.value["daily_limit"]
retention_days = each.value["retention_days"]
filter {
    query = each.value["query"]
  }

dynamic  exclusion_filter {
  for_each = each.value["exclusion_filter"]
    content {
        is_enabled = true
        name       = exclusion_filter.value.name

        filter {
            query       = exclusion_filter.value.query
            sample_rate = 1
        }
    } 
}
}
