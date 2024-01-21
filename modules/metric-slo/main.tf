
resource "datadog_service_level_objective" "slo-metric" {
  for_each = { for e in var.slo_configs : e.name => e }

  name        = each.value.name
  type        = each.value.type
  description = each.value.description
  monitor_ids = each.value.monitor_ids

  dynamic "query" {
    for_each = each.value.query != null ? [each.value.query] : []

    content {
      numerator   = query.value.values.numerator
      denominator = query.value.values.denominator
    }
}

  dynamic "thresholds" {
    for_each = each.value.thresholds

    content {
      timeframe = thresholds.value.timeframe
      target    = thresholds.value.target
      warning   = thresholds.value.warning
    }
  }

  timeframe         = each.value.timeframe
  target_threshold  = each.value.target_threshold
  warning_threshold = each.value.warning_threshold

  tags = each.value.tags
}


