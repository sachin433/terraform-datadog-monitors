module "service-check-monitor" {
  source  = "kabisa/service-check-monitor/datadog"
  version = "2.0.0"
  metric_name = var.metric_name
  alert_message = var.alert_message
  critical_threshold = var.critical_threshold
  env = var.env
  name = var.name
  include_tags = coalesce( var.include_tags )
  no_data_timeframe = var.no_data_timeframe
  ok_threshold = var.ok_threshold
  priority = var.priority
  service = var.service
  warning_threshold = var.warning_threshold
  by_tags     =  coalesce( var.by_tags )
  auto_resolve_time_h         = var.auto_resolve_time_h
  new_group_delay  = var.new_group_delay 
}
