resource "datadog_monitor" "Monitor" {
  for_each = { for e in var.dd_properties : e.name => e }
  name               = lookup(each.value, "name")
  type               = lookup(each.value, "alert_type")
  message            = lookup(each.value, "alert_message")
  priority           = lookup(each.value, "ddpriority")

  query = lookup(each.value, "alert_query")

  monitor_thresholds {
    warning  = lookup(each.value, "alert_warning")
    critical = lookup(each.value, "alert_critical")
    critical_recovery = lookup(each.value, "alert_critical_recovery")
    warning_recovery = lookup(each.value, "alert_warning_recovery")
  }


  include_tags = true
  
  new_group_delay = lookup(each.value, "new_group_delay")
  timeout_h = lookup(each.value, "timeout_h")

  tags = ["env:${var.env}", "created-by:terraform"]
}




