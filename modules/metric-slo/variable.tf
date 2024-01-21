variable "slo_configs" {
  type = map(object({
    name        = string
    type        = string
    description = string
    monitor_ids = optional(set(number))
    query       = optional(map(object({
      numerator     = string
      denominator   = string
    })))
    thresholds  = map(object({
      timeframe = string
      target    = number
      warning   = number
    }))
    timeframe         = string
    target_threshold  = number
    warning_threshold = number
    tags              = list(string)
  }))
  }

variable "datadog_app_key" {
  description = "API key for Datadog Auth"
  type        = string
}
variable "datadog_api_key" {
  description = "APP key for Datadog Auth"
  type        = string
}
