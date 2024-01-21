variable "datadog_app_key" {
  description = "API key for Datadog Auth"
  type        = string
}
variable "datadog_api_key" {
  description = "APP key for Datadog Auth"
  type        = string
}

variable "dd_properties" {
  type = list(object({
    name = string
    alert_type = string
    alert_message = string
    alert_query = string
    alert_warning = optional(number)
    alert_critical = number
    alert_critical_recovery = optional (number)
    alert_warning_recovery = optional (number)
    ddpriority = optional (number)
    timeout_h = optional (number)
    new_group_delay = optional (number)
    recovery_window = optional (string)
    trigger_window = optional (string)
  }))
}


variable "dd_tags" {
  type = list(object({
    metric_name = string
    metric_type = string
    metric_tags = list(string)  
    include_percentiles = optional (bool)
  }))
}


variable "dd_metadata" {
  type = list(object({
    metric = string
    unit = optional (string)
    type = optional (string)
  }))
}


variable "env" {
  type = string
} 


variable "metric_name" {
  type = string
}

variable "alert_message" {
  type = string
}

variable "critical_threshold" {
  type = number
}

variable "name" {
  type = string
}

variable "include_tags" {
  type = list(string)
}

variable "no_data_timeframe" {
  type = number
}

variable "ok_threshold" {
  type = number
}

variable "priority" {
  type = number 
}

variable "service" {
  type = string
}

variable "warning_threshold" {
  type = number
}

variable "by_tags" {
  type = list(string)
}

variable "auto_resolve_time_h" {
  type = number
}
  variable "new_group_delay" {
  type = number
}



variable "dd_downtime" {
  type = list(object({
    scope = list(string)
    monitor_id = number
    message = string
  }))
}

variable "log_indexes" {
  type = map(object({
   name = string
   daily_limit = string
   retention_days = string
   query = string
   exclusion_filter = list(object({
    name = optional(string)
    query = optional(string)
   }))
  }))
}

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